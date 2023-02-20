import 'TableMenuList.dart';

class GetWinesDataModel {
  GetWinesDataModel({
      this.restaurantId, 
      this.restaurantName, 
      this.restaurantImage, 
      this.tableId, 
      this.tableName, 
      this.branchName, 
      this.nexturl, 
      this.tableMenuList,});

  GetWinesDataModel.fromJson(dynamic json) {
    restaurantId = json['restaurant_id'];
    restaurantName = json['restaurant_name'];
    restaurantImage = json['restaurant_image'];
    tableId = json['table_id'];
    tableName = json['table_name'];
    branchName = json['branch_name'];
    nexturl = json['nexturl'];
    if (json['table_menu_list'] != null) {
      tableMenuList = [];
      json['table_menu_list'].forEach((v) {
        tableMenuList?.add(TableMenuList.fromJson(v));
      });
    }
  }
  String? restaurantId;
  String? restaurantName;
  String? restaurantImage;
  String? tableId;
  String? tableName;
  String? branchName;
  String? nexturl;
  List<TableMenuList>? tableMenuList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['restaurant_id'] = restaurantId;
    map['restaurant_name'] = restaurantName;
    map['restaurant_image'] = restaurantImage;
    map['table_id'] = tableId;
    map['table_name'] = tableName;
    map['branch_name'] = branchName;
    map['nexturl'] = nexturl;
    if (tableMenuList != null) {
      map['table_menu_list'] = tableMenuList!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}