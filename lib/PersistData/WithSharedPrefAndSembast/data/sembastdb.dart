import 'dart:async';

import 'package:all_flutter_gives/PersistData/WithSharedPrefAndSembast/data/sembast_codec.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../models/password.dart';

//todo : Sembast means Simple Embedded Application Store. Data is store in JSON format in a single file
//todo : You can store
// 1. String
// 2. num (int and double)
// 3. Map (Map<String, dynamic>)
// 4. List (List<dynamic>)
// 5. bool
// 6. null
// 7. Blob (custom type)
// 8. Timestamp

class SembastDb {
  DatabaseFactory dbFactory = databaseFactoryIo;
  Database _db;

  final store = intMapStoreFactory.store('passwords');

  //todo: Securing data
  var codec = getEncryptSembastCodec(password: 'Password');

  // todo: Creating singleton by making sure only one instance of Sembast Db is used across the application
  static SembastDb _singleton = SembastDb._internal();
  SembastDb._internal() {}
  factory SembastDb() {
    return _singleton;
  }

  //todo : Use this to initialize the DB
  Future<Database> init() async {
    if (_db == null) {
      _db = await _openDb();
    }
    return _db;
  }

  // todo: You need to open DB, get the path where data will be stored before starting DB operations
  Future _openDb() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final dbPath = join(docsDir.path, 'path.db');
    final db = await dbFactory.openDatabase(dbPath, codec: codec);
    return db;
  }

//  todo: Storing data and returning a unique identifier for the data stored
  Future<int> addPassword(Password password) async {
    int id = await store.add(_db, password.toMap());
    return id;
  }

  Future getPassword() async {
    await init(); //todo: Initialize DB
    final finder = Finder(sortOrders: [
      SortOrder('name')
    ]); //todo: Order documents with a Finder instance
    final snapshot =
        await store.find(_db, finder: finder); //todo: Retrieve existing data
    return snapshot.map((item) {
      //todo: Return a list of objects
      final pwd = Password.fromMap(item.value);
      pwd.id = item.key;
      return pwd;
    }).toList();
  }

  Future updatePassword(Password pwd) async {
    final finder = Finder(filter: Filter.byKey(pwd.id));
    await store.update(_db, pwd.toMap(), finder: finder);
  }

  Future deletePassword(Password pwd) async {
    final finder = Finder(filter: Filter.byKey(pwd.id));
    await store.delete(_db, finder: finder);
  }

  Future deleteAll() async {
    await store.delete(_db);
  }
}
