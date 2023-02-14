import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:news_app/business_logic/bloc/theme_state.dart';


class ThemeCuibt extends Cubit<ThemeState>{
  ThemeCuibt() : super(ThemeInitial());
   bool light= ThemeInitial().lightValie() ;
  var box=Hive.box("light");
  Future<void> chooseTheme() async {

    light=!light;
    await box.put("light", light);

    emit(ThemeInitial());
  }

}