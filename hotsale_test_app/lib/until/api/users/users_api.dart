import 'dart:convert';

import 'package:hotsale_test_app/until/api/method_api.dart';
import 'package:hotsale_test_app/until/model/user_model.dart';

import '../../storage/local_storage.dart';

class UsersApi {
  Future<List<UserModel>?> fetchData({String options = '?page=1'}) async {
    try {
      final response =
          await ApiMethod().methodGet('users/' + options + "&per_page=4");

      if (response.statusCode != 200) {
        print('Response Code: ${response.statusCode}');
        return null;
      }

      if (options == '?page=1') {
        await LocalStorage().setLocalData(response.body);

        await LocalStorage()
            .saveTotalPages(json.decode(response.body)['total_pages']);
      }else{
        await LocalStorage().updateLocalData(response.body);
      }

      List data = json.decode(response.body)['data'];

      return data.map((json) => UserModel.fromJson(json)).toList();
    } on Exception catch (e) {
      print('error ${e}');
    }
  }

  Future<UserModel?> fetchSingle(id) async {
    try {
      final response = await ApiMethod().methodGet('users/' + id.toString());

      if (response.statusCode != 200) {
        print('Response Code: ${response.statusCode}');
        return null;
      }

      print(json.decode(response.body)['data']);

      return UserModel.fromJson(json.decode(response.body)['data']);
    } on Exception catch (e) {
      print('error ${e}');
    }
  }
}
