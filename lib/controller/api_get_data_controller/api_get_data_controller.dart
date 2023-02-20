import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/api_get_data/data_model/GetWinesDataModel.dart';
import '../../models/api_get_data/dio_client_get_wines_data_model.dart';
import '../../models/api_get_data/get_wines_data_model.dart';

class GetDataApiController extends GetxController {
  final Rx<GetWinesDataModel?> mainDataModel = Rxn<GetWinesDataModel>();
  PageController page = PageController(initialPage: 0);

  RxInt productCount=0.obs;

  RxInt currentIndex=0.obs;

  /*   if (pageIndex >= lengthWidgetList!) {
                                    print("called ageIndex==lengthWidgetList");
                                    Get.offAll(GiveFeedbackMessageScreen(
                                      patientID: patient_id,
                                    ));
                                  } else {
                                    page.animateToPage(pageIndex,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.linearToEaseOut);
                                  }*/

  @override
  void onInit() {
    // TODO: implement onInit

    getHomeElementsUserFunction();
    super.onInit();
  }

  DioClientGetWinesDataModel dioClientGetWinesDataModel =
      DioClientGetWinesDataModel();

  void getHomeElementsUserFunction() async {
    dioClientGetWinesDataModel.getRelatedReadingBook().then((value) {
      mainDataModel.value = value;

      print(
          "GetRecommendationReadBooksController v======${mainDataModel.value?.restaurantName}");
    });
  }
}
