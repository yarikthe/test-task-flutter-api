import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hotsale_test_app/until/api/users/users_api.dart';
import 'package:hotsale_test_app/until/model/user_model.dart';

class UserController extends GetxController with StateMixin<List<UserModel>> {

  var users = <UserModel>[].obs;
  var isLoad = true.obs;
  int get countUsers => users.length; 


  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  @override
  void onReady(){
    super.onReady();
  }

  void onClose(){
    super.onClose();
  }

  void fetch()async {

      final data = await UsersApi().fetchData();

      if(data != null){

          users.value = data;
      }

      isLoad.value = false;

      update();
  }

}