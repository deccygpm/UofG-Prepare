import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  Future<void> setSchool(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('school', id);
    print(prefs.get('school').toString());
  }
}
