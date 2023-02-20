import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/instance_manager.dart';

import '../controller/splash_screen_controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
final splashScreenController=Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            child: Image.asset("assets/logo/shoppingapplogo.png"),
          ),
        ),
      ),
    );
  }
}
