import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  Future<void> setSchool(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('school', id);
    print(prefs.get('school').toString());
  }

  Future<bool> isSchoolSet() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('school');
  }

  getSchool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? school = prefs.getString('school');
    return school;
  }

  Future<void> clearAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
