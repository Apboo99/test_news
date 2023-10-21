
import 'package:shared_preferences/shared_preferences.dart';

import '../values/constant.dart';

class StorageServices{
  //_prefs is global variable and it seen in everywhere in class
  late final SharedPreferences _prefs;

  Future<StorageServices> init()async{
    _prefs= await SharedPreferences.getInstance();
     return this;
  }
  Future<bool> setBool(String key,bool value)async{
    return await _prefs.setBool(key, value);
  }
  Future<bool> setString(String key,String value)async{
    return await _prefs.setString(key, value);
  }
   bool getThatOnBoardingOpened(){
   return _prefs.getBool(AppConstant.onBoardingOpened)??false;
  }
  bool getLogIn(){
    return _prefs.getString(AppConstant.onUserLogin)==null?false:true;
  }
  // Future<bool> removeKey(String key){
  //   return _prefs.remove(key);
  // }

}


