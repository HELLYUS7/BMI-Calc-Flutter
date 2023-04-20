import 'package:flutter/material.dart';

class AppThemeController extends ChangeNotifier {
  static AppThemeController instance = AppThemeController();
  Color color = Colors.purple;
  int numberColor = 0;
  bool themeDark = false;
  changeTheme(){
    themeDark = !themeDark;
    notifyListeners(); 
  }

  changeColor(Color newColor, int n){
    color = newColor;
    numberColor = n;
    notifyListeners();
  }
}