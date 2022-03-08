


import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalService {

  final String keyUser = "key_user_id";

  final SharedPreferences _sharedPreferences = GetIt.instance.get();

  String getKeyUser() {
    return _sharedPreferences.getString(keyUser) ?? '';
  }

  Future saveKeyUser(String kUser) {
    return _sharedPreferences.setString(keyUser, kUser);
  }

}