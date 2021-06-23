
import 'package:all_flutter_gives/GetXWorld/models/users.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final user = User().obs;

  updateUser(int count) {
    //Which is better??

    //Option #1
    user().name = "Tadas";
    user().count = count;

    //Option #2
    user.update((value) {
      value.name = 'Tadas';
      value.count = count;
    });
  }
}