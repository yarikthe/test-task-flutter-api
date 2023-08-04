
import 'dart:convert';

import 'package:hotsale_test_app/until/api/method_api.dart';
import 'package:hotsale_test_app/until/model/user_model.dart';

class UsersApi {

  Future<List<UserModel>?> fetchData({String options = '?page=1&per_page=4'}) async{

      try{

        final response = await ApiMethod().methodGet('users/' + options);

        if(response.statusCode != 200){
          print('Response Code: ${response.statusCode}');
          return [];
        }

        List data = json.decode(response.body)['data'];

        return data.map((json) => UserModel.fromJson(json)).toList();

      }on Exception catch (e) {

        print('error ${e}');
      }
  }

  Future<UserModel?> fetchSingle({String options = ''}) async{

      try{

        final response = await ApiMethod().methodGet('users/' + options);

        if(response.statusCode != 200){
          print('Response Code: ${response.statusCode}');
          return null;
        }

        return json.decode(response.body).map((json) => UserModel.fromJson(json)) as UserModel;

      }on Exception catch (e) {

        print('error ${e}');
      }
  }

}