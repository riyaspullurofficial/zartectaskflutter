import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constant_url.dart';
import '../constants/text_constants.dart';
import 'authentication.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userEmailOTPController = TextEditingController();

  TextEditingController _userPhoneController = TextEditingController();
  TextEditingController _userPhoneOTPController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoading = false;

  String? verificationId;

  Future<void> phoneSignIn({required String phoneNumber}) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: _onVerificationCompleted,
        verificationFailed: _onVerificationFailed,
        codeSent: _onCodeSent,
        codeAutoRetrievalTimeout: _onCodeTimeout);
  }

  _onVerificationCompleted(PhoneAuthCredential authCredential) async {
    print("verification completed ${authCredential.smsCode}");
    User? user = FirebaseAuth.instance.currentUser;
    /*  setState(() {
      this.otpCode.text = authCredential.smsCode!;
    });*/
    if (authCredential.smsCode != null) {
      try {
        UserCredential credential =
            await user!.linkWithCredential(authCredential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'provider-already-linked') {
          await _auth.signInWithCredential(authCredential);
        }
      }
      Get.to(HomeScreen());
    }
  }

  _onVerificationFailed(FirebaseAuthException exception) {
    print("failed OTP");
    if (exception.code == 'invalid-phone-number') {
      Get.snackbar("Failed", "The phone number entered is invalid!",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.black);
    }
  }

  _onCodeSent(String verificationId, int? forceResendingToken) {
    this.verificationId = verificationId;
    print(forceResendingToken);
    print("code sent");
  }

  _onCodeTimeout(String timeout) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin:
              const EdgeInsets.only(left: 25, right: 25, top: 0, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Container(
                child: Image.asset("assets/logo/shoppingapplogo.png"),
              ),
              Container(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final responseEmail =
                            Authentication.signInWithGoogle(context: context);

                        responseEmail.then((value) {
                          if (value?.emailVerified == true) {
                            Get.snackbar("Email  Verified", "Congrats",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green[700],
                                colorText: Colors.white);
                            Get.to(HomeScreen());
                          } else {
                            Get.snackbar("Email not Verified",
                                "Please check your email address",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.black,
                                colorText: Colors.red);
                          }
                        });

                        print("response email credential=$responseEmail");

                        /*showModalBottomSheet(
                            context: context,
                            builder: (BuildContext cnxt) {
                              return Container(
                                height: 300,
                                padding: EdgeInsets.all(15),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: _userEmailController,
                                      decoration:
                                          InputDecoration(label: Text('Email')),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: _userEmailOTPController,
                                      decoration:
                                          InputDecoration(label: Text('OTP')),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        print("signin email submit");
                                         //   Get.to(HomeScreen());

                                        final responseEmail =
                                            await Authentication
                                                .signInWithGoogle(
                                                    context: context);

                                        print("response email credential=$responseEmail");


                                      },
                                      child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          margin: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          decoration: BoxDecoration(
                                              color: Colors.blueAccent[700]!,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(50))),
                                          child: const Center(
                                            child: Text(
                                              "Submit",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                              );
                            });*/
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.blue,
                                  Colors.blueAccent,
                                ],
                                begin: FractionalOffset(0.0, 0.0),
                                end: FractionalOffset(1.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                            borderRadius:
                                BorderRadius.all(Radius.circular(80))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                googleIconUrl,
                                height: 30.0,
                                width: 30.0,
                              ),
                            ),
                            Container(
                              child: const Text(
                                google_text,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext cnxt) {
                              return Container(
                                height: 300,
                                padding: EdgeInsets.all(15),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: _userPhoneController,
                                      decoration: InputDecoration(
                                          label: Text('Mobile number')),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: _userPhoneOTPController,
                                      decoration:
                                          InputDecoration(label: Text('OTP')),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print("signin mobile submit");
                                        /*       Get.to(HomeScreen());*/
                                        final textPhone = _userPhoneController
                                            .text
                                            .toString();

                                        if (textPhone == null ||
                                            textPhone == "") {
                                        } else {
                                          final phoneNumberString =
                                              "+91$textPhone";
                                          phoneSignIn(
                                              phoneNumber: phoneNumberString);
                                        }
                                      },
                                      child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          margin: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          decoration: BoxDecoration(
                                              color: Colors.green[700],
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(50))),
                                          child: const Center(
                                            child: Text(
                                              "Submit",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.greenAccent,
                                  Colors.green,
                                ],
                                begin: FractionalOffset(0.0, 0.0),
                                end: FractionalOffset(1.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                            borderRadius:
                                BorderRadius.all(Radius.circular(80))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: const Icon(
                                Icons.call,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                            Container(
                              child: const Text(
                                phone_text,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(),
                          ],
                        ),
                      ),
                    ),
                    Container(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
