import 'package:hive/hive.dart';

abstract class ThemeState{
}
class ThemeInitial extends ThemeState{

  bool lightValie()  {
     var box=Hive.box("light");
    if(box.get("light")==null|| box.get("light")==false){
      return false;
    }
    return true;
  }
}