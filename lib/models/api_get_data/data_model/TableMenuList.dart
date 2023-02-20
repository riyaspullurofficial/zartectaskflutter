import 'CategoryDishes.dart';

class TableMenuList {
  TableMenuList({
      this.menuCategory, 
      this.menuCategoryId, 
      this.menuCategoryImage, 
      this.nexturl, 
      this.categoryDishes,});

  TableMenuList.fromJson(dynamic json) {
    menuCategory = json['menu_category'];
    menuCategoryId = json['menu_category_id'];
    menuCategoryImage = json['menu_category_image'];
    nexturl = json['nexturl'];
    if (json['category_dishes'] != null) {
      categoryDishes = [];
      json['category_dishes'].forEach((v) {
        categoryDishes?.add(CategoryDishes.fromJson(v));
      });
    }
  }
  String? menuCategory;
  String? menuCategoryId;
  String? menuCategoryImage;
  String? nexturl;
  List<CategoryDishes>? categoryDishes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['menu_category'] = menuCategory;
    map['menu_category_id'] = menuCategoryId;
    map['menu_category_image'] = menuCategoryImage;
    map['nexturl'] = nexturl;
    if (categoryDishes != null) {
      map['category_dishes'] = categoryDishes!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}