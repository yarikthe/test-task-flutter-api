import 'dart:convert';
import 'dart:ffi';

import 'package:hotsale_test_app/until/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<List<UserModel>> getLocalData() async {
    final SharedPreferences prefs = await _prefs;

    String? users = prefs.getString('users');
    var data = jsonDecode(users!);

    return data.map((json) => UserModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  Future<UserModel?> getLocalSingle(id) async {
    final SharedPreferences prefs = await _prefs;

    String? users = prefs.getString('users');
    var data = jsonDecode(users!);

    return data
        .map((json) => UserModel.fromJson(json as Map<String, dynamic>))
        .where((element) => element.id == id)
        .first;
  }

  Future<void> setLocalData(data) async {
    final SharedPreferences prefs = await _prefs;

    String usersList = jsonEncode(json.decode(data)['data']);

    await prefs.setString('users', usersList);
  }

  Future<void> updateLocalData(data) async {
    final SharedPreferences prefs = await _prefs;

    String? oldUsersList = prefs.getString('users'); 
    String newUsersList = jsonEncode(json.decode(data)['data']);
    
    String _data = (oldUsersList! + newUsersList).replaceAll('][', ',');

    await prefs.setString('users',_data);
  }

  Future<void> clearLocalData() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.remove('users');
  }

  Future<void> saveTotalPages(value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt('total_pages', value);
  }

  Future<int> getTotalPages() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt('total_pages')!.toInt();
  }

}
