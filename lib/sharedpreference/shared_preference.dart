
import '../main.dart';

class SharedPrefrence {

  static const _IS_LOGIN = "toffelearn_isLogin";
  static const _IS_CHAT = "toffelearn_isChat";

  static const ACCESS_TOKEN = "toffelearn_access_token";

  static const _REFRESH_TOKEN= "toffelearn_refreshtoken";

  


  static final SharedPrefrence _singleton =
  new SharedPrefrence._internal();

  factory SharedPrefrence() {
    return _singleton;
  }

  SharedPrefrence._internal();

  deleteAll() async {
    await sharedPrefrence!.clear();
  }

  String? getToken() {
    return sharedPrefrence!.getString(ACCESS_TOKEN);
  }

  setToken(String token) {
    //var userDetails = UserDetails().getUserDetails();
    sharedPrefrence!.setString(ACCESS_TOKEN, token);
  }






  // String? getRefreshToken() {
  //   return sharedPrefrence.getString(_REFRESH_TOKEN);
  // }
  
  //  setToken(String token) {
  //   //var userDetails = UserDetails().getUserDetails();
  //   sharedPrefrence.setString(ACCESS_TOKEN, token);
  // }

 



}
