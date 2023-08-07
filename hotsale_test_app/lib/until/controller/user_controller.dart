import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hotsale_test_app/until/api/users/users_api.dart';
import 'package:hotsale_test_app/until/internet/check_internet.dart';
import 'package:hotsale_test_app/until/model/user_model.dart';
import 'package:hotsale_test_app/until/storage/local_storage.dart';

class UserController extends GetxController with StateMixin<List<UserModel>> {
  
  var users = <UserModel>[].obs;
  var isLoad = true.obs;
  int get countUsers => users.length;

  late UserModel? singleUser;
  var isUserLoad = true.obs;

  var loadUserMoreText = ''.obs;
  var isLoadMore = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init () async{
    var statusOnline  = await CheckConnectionToInternet().getInternetConnectStatus();

    if(statusOnline == 'Offline'){
     localFfetch();
    }else{
     fetch();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  void onClose() {
    users.clear();
    clearSingleUserData();
    super.onClose();
  }

  void fetch() async {
    final data = await UsersApi().fetchData();

    if (data != null) {
      users.value = data;
    }

    isLoad.value = false;
    update();
  }

  void loadMore(page) async {
    
    isLoadMore.value = true;
    update();

    final data = await UsersApi().fetchData(options: "?page=" + page);

    if (data != null) {
      users.addAll(data);
      loadUserMoreText.value = 'Loaded new users';
    }else{
      loadUserMoreText.value = 'All users loaded';
    }

    loadUserMoreText.value = '';
    isLoadMore.value = false;
    update();
  }

  void localFfetch() async {
    final data = await LocalStorage().getLocalData();

    if (data != null) {
      users.value = data;
    }

    isLoad.value = false;
    update();
  }

  void single(id) async {
    final user = await UsersApi().fetchSingle(id);

    if (user != null) {
      singleUser = user;
    }

    isUserLoad.value = false;
    update();
  }

  void localSingle(id) async {

    final user = await LocalStorage().getLocalSingle(id);

    if (user != null) {
      singleUser = user;
    }

    isUserLoad.value = false;
    update();
  }

  void clearSingleUserData(){

    singleUser = null;
    isUserLoad.value = true;
    update();
  }
}
