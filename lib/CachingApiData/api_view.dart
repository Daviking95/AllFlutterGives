

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'api_call_http.dart';
import 'api_response_model.dart';

class CachingApiDataScreen extends StatefulWidget {
  @override
  _CachingApiDataScreenState createState() => _CachingApiDataScreenState();
}

class _CachingApiDataScreenState extends State<CachingApiDataScreen> {

  ApiCall _apiCall = new ApiCall();

  Future<void> _deleteCacheContents() async {
    final cacheDir = await getTemporaryDirectory();
    String fileName = "CacheData.json";

    if (await File(cacheDir.path + "/" + fileName).exists()) {
      cacheDir.delete(recursive: true);
      print("Deleted the CacheJson file!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Caching"),
        centerTitle: true,
      ),
      body: FutureBuilder<ApiResponse>(
        future: _apiCall.getUserDataResponse(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<UserData> usersList = List<UserData>();

            usersList = snapshot.data.data;

            return ListView.builder(
                itemCount: usersList.length,
                itemBuilder: (context, index) {
                  UserData userData = usersList[index];
                  return ListTile(
                    title: Text(userData.firstName + " " + userData.lastName),
                    subtitle: Text(userData.email),
                  );
                });
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _deleteCacheContents,
        tooltip: 'Delete the Cache file',
        child: Icon(Icons.delete),
      ),
    );
  }
}
