import 'dart:convert';

import 'package:hotsale_test_app/until/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<List<UserModel>> getLocalData() async{
    
    final SharedPreferences prefs = await _prefs;

    List data = json.decode(prefs.getString('users') as String)['data'];

    return data.map((json) => UserModel.fromJson(json)).toList();
  }

  Future<UserModel?> getLocalSingle(id) async{

    final SharedPreferences prefs = await _prefs;

    List data = json.decode(prefs.getString('users') as String)['data'];

    return data.map((json) => UserModel.fromJson(json)).where((element) => element.id == id).first; 
  }

  Future<void> setLocalData(data) async{
    
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('users', data);
  }

  Future<void>updateLocalData(data) async{

    setLocalData(data);

    final SharedPreferences prefs = await _prefs;

    // List currentData = json.decode(prefs.getString('users') as String)['data'];

    // print(' data now ${currentData}');

    // print(' data NEW ${data}');

    // await prefs.setString('users',   data);
  } 

  Future<void> clearLocalData() async{
    
    final SharedPreferences prefs = await _prefs;
    await prefs.remove('users');  
  }
}