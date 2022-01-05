import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences? local;
String? userName;

class LocalController {
  initLocal() async {
    local = await SharedPreferences.getInstance();
  }

  loadData() async {
    var get = await local?.getString('user');
    userName = get;
    print(userName);
  }

  setData(String user) async {
    await local?.setString('user', user);
    await loadData();
  }
}
