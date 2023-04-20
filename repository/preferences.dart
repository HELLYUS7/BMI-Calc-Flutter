import 'package:shared_preferences/shared_preferences.dart';

class preferences{
  static preferences instance = preferences();
  preferences(){
    init();
  }
  Future init() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

}