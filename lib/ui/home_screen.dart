import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zartectaskflutter/ui/navigation_drawer.dart';

import '../constants/constant_url.dart';
import '../constants/text_constants.dart';
import '../controller/api_get_data_controller/api_get_data_controller.dart';
import 'home_screen/home_main_screen.dart';
import 'order_summary_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final apiMainController = Get.put(GetDataApiController());
  PageController page = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: const Drawer(
        backgroundColor: Colors.yellow,
        child: NavigationDrawer(),
      ),
      body: SafeArea(
        key: scaffoldKey,
        child: Container(
          margin:
              const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(builder: (context) {
                        print(" saddsadsadsadsad");
                        return GestureDetector(
                          onTap: () => Scaffold.of(context).openDrawer(),
                          child: SvgPicture.asset(
                            "assets/icons/hambergersvg.svg",
                            height: 30,
                            width: 30,
                            color: Colors.grey[700],
                          ),
                        );
                      }),
                      Container(
                        height: 35,
                        width: 35,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              size: 30,
                              color: Colors.grey[700],
                            ),
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: const Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              /* Expanded(child: HomeMainScreen())*/

              Container(
                height: 43,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Obx(
                      () => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: apiMainController
                              .mainDataModel.value?.tableMenuList?.length,
                          itemBuilder: (cnx, index) {
                            return Row(
                              children: [
                                apiMainController.currentIndex.value == index
                                    ? Container(
                                        height: 39,
                                        width: 100,
                                        child: Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 3),
                                              height: 39,
                                              width: 100,
                                              child: Center(
                                                child: Text(
                                                  apiMainController
                                                          .mainDataModel
                                                          .value
                                                          ?.tableMenuList?[
                                                              index]
                                                          .menuCategory ??
                                                      "",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 2,
                                              color: Colors.red,
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(
                                        height: 39,
                                        width: 100,
                                        child: Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            Container(
                                              height: 39,
                                              width: 100,
                                              margin:
                                                  EdgeInsets.only(bottom: 3),
                                              child: Center(
                                                child: Text(
                                                  apiMainController
                                                          .mainDataModel
                                                          .value
                                                          ?.tableMenuList?[
                                                              index]
                                                          .menuCategory ??
                                                      "",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 2,
                                              color: Colors.transparent,
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
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Obx(() => Expanded(
                    child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: page,
                        pageSnapping: true,
                        itemCount: apiMainController
                            .mainDataModel.value?.tableMenuList?.length,
                        itemBuilder: (cnx, pageViewIndex) {
                          print(
                              "table menu List=${apiMainController.mainDataModel.value?.tableMenuList?.length}");
                          apiMainController.currentIndex.value = pageViewIndex;
                          final datamin = apiMainController.mainDataModel.value
                              ?.tableMenuList?[pageViewIndex].categoryDishes;
                          print("pageview index=$pageViewIndex");
                          return Container(
                            /*color:
                            index % 2 == 0 ? Colors.yellow : Colors.cyanAccent,*/
                            child: Container(
                              child: ListView.builder(
                                  itemCount: apiMainController
                                      .mainDataModel
                                      .value
                                      ?.tableMenuList?[pageViewIndex]
                                      .categoryDishes
                                      ?.length,
                                  itemBuilder: (cnx, indexListView) {
                                    var titleDishNameString = apiMainController
                                        .mainDataModel
                                        .value
                                        ?.tableMenuList?[pageViewIndex]
                                        .categoryDishes?[indexListView]
                                        .dishName;

                                    if (titleDishNameString != null &&
                                        titleDishNameString.length > 25) {
                                      titleDishNameString =
                                          "${titleDishNameString.substring(0, 25)}...";
                                    }

                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(OrderSummary());
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: 20,
                                                        width: 20,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                        .green[
                                                                    700]!)),
                                                        child: Container(
                                                          height: 10,
                                                          width: 10,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .green[700]!,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                          ),
                                                        ),
                                                      ),
                                                      Container()
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        titleDishNameString ==
                                                                    null ||
                                                                titleDishNameString ==
                                                                    ""
                                                            ? "Spinach Salad"
                                                            : titleDishNameString,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 16),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        width: 200,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              apiMainController
                                                                              .mainDataModel
                                                                              .value
                                                                              ?.tableMenuList?[
                                                                                  pageViewIndex]
                                                                              .categoryDishes?[
                                                                                  indexListView]
                                                                              .dishPrice ==
                                                                          null ||
                                                                      apiMainController
                                                                              .mainDataModel
                                                                              .value
                                                                              ?.tableMenuList?[pageViewIndex]
                                                                              .categoryDishes?[indexListView]
                                                                              .dishPrice ==
                                                                          ""
                                                                  ? "SAR 7.95"
                                                                  : "SAR ${apiMainController.mainDataModel.value?.tableMenuList?[pageViewIndex].categoryDishes?[indexListView].dishPrice}",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      700],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 14),
                                                            ),
                                                            Text(
                                                              "15 calories",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      700],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                                        child: Text(
                                                          apiMainController
                                                                  .mainDataModel
                                                                  .value
                                                                  ?.tableMenuList?[
                                                                      pageViewIndex]
                                                                  .categoryDishes?[
                                                                      indexListView]
                                                                  .dishDescription ??
                                                              lorem_text,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 12),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        width: 120,
                                                        height: 30,
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10,
                                                                right: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .green[600]!,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                        ),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                                height: double
                                                                    .infinity,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        apiMainController
                                                                            .productCount
                                                                            .value = apiMainController
                                                                                .productCount.value -
                                                                            1;
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .minimize,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            20,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )),
                                                            Obx(() =>Text(
                                                              apiMainController
                                                                  .productCount
                                                                  .value
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),),
                                                            GestureDetector(
                                                              onTap: () {
                                                                apiMainController
                                                                    .productCount
                                                                    .value = apiMainController
                                                                        .productCount
                                                                        .value +
                                                                    1;
                                                              },
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                                size: 20,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
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
                          );
                        }),
                  ))
            ],
          ),
        ),
      ),
    );
  }

/*Widget pagViewer(){

    return Obx(() => Container(child: Stack(children: [


    ],),));
  }*/
}
