

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/home_screen.dart';
import '../../ui/login_screen.dart';

class SplashScreenController extends GetxController {

  RxBool dataLogHome=false.obs;

  @override
  void onInit() {
    // TODO: implement onInit

    screenWaiting();
    super.onInit();
  }


  Future<void> screenWaiting() async {
    await Future.delayed(const Duration(seconds: 5));
    /*Get.offAll(LoginScreen());*/

    final acsToken = getAccessTokenSharedPreferences();
    acsToken.then((value) {
      if (value == null || value == "") {
        Get.offAll(LoginScreen());
      } else {
        Get.offAll(HomeScreen());
      }
    });
  }

  Future<String?> getAccessTokenSharedPreferences() async {
    final sp = await SharedPreferences.getInstance();
    final token = await sp.getString('userAccessToken');
    print("token is splash==$token");
    return token;
  }
}