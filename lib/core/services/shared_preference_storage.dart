import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocalStorage {
  SharedPreferencesLocalStorage._privateConstructor();

  static final SharedPreferencesLocalStorage instance =
      SharedPreferencesLocalStorage._privateConstructor();

  setStringValue(String key, String value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString(key, value);
  }
}
