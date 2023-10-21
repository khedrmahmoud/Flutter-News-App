import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';

import 'config.dart';
class MyTheme with ChangeNotifier{
  static bool _isdark=true;

  ThemeMode currentTheme(){
    return _isdark?ThemeMode.dark:ThemeMode.light;
  }

  void switchmode (){
    _isdark=!_isdark;

    notifyListeners();
  }

}