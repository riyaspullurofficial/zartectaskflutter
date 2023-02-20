import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/constant_url.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 27),
            child: Column(
              children: [
                Container(
                    height: 40,
                    width: double.infinity,
                    color: Colors.green,
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.arrow_back,
                            size: 25,
                            color: Colors.white,
                          ),
                          onTap: () {
                            print("nav home clicked...");
                            /*            Navigator.pop(context);*/
                            Get.back();
                          },
                        ),
                      ],
                    )),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.green[300]!,
                          Colors.green[400]!,
                          Colors.green[500]!,
                          Colors.green[600]!,
                          Colors.green[800]!,
                        ],
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          testProfileURL,
                          height: 70.0,
                          width: 70.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        "Muhammed Naseem",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Text(
                        "ID : 410",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.logout,
                        size: 30,
                        color: Colors.grey[500],
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[500],
                        ),
                      ),
                      Container()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
