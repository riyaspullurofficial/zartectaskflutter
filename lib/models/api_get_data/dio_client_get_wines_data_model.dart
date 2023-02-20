import 'dart:convert';

import 'package:dio/dio.dart';

import '../../constants/api_constants.dart';
import 'data_model/GetWinesDataModel.dart';
import 'get_wines_data_model.dart';
GetWinesDataModel getWinesDataModelFromJson(String str) => GetWinesDataModel.fromJson(json.decode(str));

class DioClientGetWinesDataModel extends Interceptor {
  final Dio _dio = Dio();

  Future<GetWinesDataModel?> getRelatedReadingBook() async {
    GetWinesDataModel? getWinesDataModel;
    try {
      Response responseData = await _dio.get(
        "https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad",
      );
      final statusCode = responseData.statusCode;
      print(
          "DioClientGetRelatedReadingBookModel elements data=${responseData.data}");
      print(
          "DioClientGetRelatedReadingBookModel data status code=${responseData.statusCode}");
      if (statusCode == 200) {
        print(
            "DioClientGetRelatedReadingBookModel called 200 in get home elements model");
        getWinesDataModel = GetWinesDataModel?.fromJson(responseData.data[0]);


        print("DioClientReadingBookModel data is give==== $getWinesDataModel");
        return getWinesDataModel;
      } else {
        return Future.error(Exception("Data Error api Exception"));
      }
    } on DioError catch (e) {
      return Future.error(
          Exception("DioClientGetRelatedReadingBookModel Connection Failed.."));
    }
  }
}
