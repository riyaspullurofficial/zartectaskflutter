import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        title: Text(
          "Order Summary",
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(5),
          margin:
              const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[400]!),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green[900]!,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(
                    "2 Dishes - 2 Items",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (cnx, index) {
                        return Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Column(
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
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 120,
                                    height: 130,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                            child: Text(
                                          "Gopi Manjurian Dry",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800),
                                        )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("SAR 45.00"),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text("250 calories"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 95,
                                    height: 30,
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.green[900]!,
                                      borderRadius: BorderRadius.circular(50),
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
                                              children: const [
                                                Icon(
                                                  Icons.minimize,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                              ],
                                            )),
                                        Text(
                                          "1",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "SAR 65.00",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                              Container(
                                height: 1,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Amount",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "SAR 65.00",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green[900]!,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    "Place Order",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
