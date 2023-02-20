import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/constant_url.dart';
import '../../constants/text_constants.dart';
import '../order_summary_screen.dart';

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: 100,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (cnx, index) {
                    return Row(
                      children: [
                        Container(
                          height: 30,
                          width: 100,
                          /*        color: Colors.yellow,*/
                          child: Column(
                            children: [
                              const Text(
                                "Salads an soup",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: double.infinity,
                                height: 2,
                                color: Colors.red,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    );
                  }),
            ),
            Container(
              height: 1,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (cnx, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(OrderSummary());
                        },
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 20,
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.green[700]!)),
                                          child: Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                              color: Colors.green[700]!,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                          ),
                                        ),
                                        Container()
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Spinach Salad",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: 200,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "SAR 7.95",
                                                style: TextStyle(
                                                    color: Colors.grey[700],
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14),
                                              ),
                                              Text(
                                                "15 calories",
                                                style: TextStyle(
                                                    color: Colors.grey[700],
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 40,
                                          width: 200,
                                          child: Flexible(
                                            child: Text(
                                              lorem_text,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 120,
                                          height: 30,
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.green[600]!,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  height: double.infinity,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.minimize,
                                                        color: Colors.white,
                                                        size: 20,
                                                      ),
                                                    ],
                                                  )),
                                              Text(
                                                "0",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.network(
                                        vegURL,
                                        height: 50.0,
                                        width: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 1,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
