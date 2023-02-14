
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc/tabs_screen.dart';

class ThemeCubit extends Cubit<ThemeData> {
  
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
  );

  
  
  void setTheme(ThemePref theme) {
    if(theme == ThemePref.light){
      emit(_lightTheme);
    }else if(theme == ThemePref.dark){
      emit(_darkTheme);
    }
    else{
      var brightness = SchedulerBinding.instance.window.platformBrightness;
 emit(brightness == Brightness.dark ? _darkTheme :_lightTheme);
    }
  }

   
}