
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
    textTheme: 
    ThemeData.light().textTheme.copyWith(
                titleLarge: const TextStyle(
                  // fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white
                ),
                bodyLarge: const TextStyle(color: Colors.black,fontSize: 20),
                bodySmall: const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal),
                labelSmall: const TextStyle(color: Colors.black,fontSize: 15),
                
              ),
  );

  static final _darkTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
     textTheme: ThemeData.dark().textTheme.copyWith(
                titleLarge: const TextStyle(
                  // fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white
                ),
                bodyLarge: const TextStyle(color: Colors.white,fontSize: 20),
                bodySmall: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal),
                labelSmall: const TextStyle(color: Colors.white,fontSize: 15)
              ),
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