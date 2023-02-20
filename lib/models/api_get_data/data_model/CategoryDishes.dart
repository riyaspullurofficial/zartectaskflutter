import 'AddonCat.dart';

class CategoryDishes {
  CategoryDishes({
      this.dishId, 
      this.dishName, 
      this.dishPrice, 
      this.dishImage, 
      this.dishCurrency, 
      this.dishCalories, 
      this.dishDescription, 
      this.dishAvailability, 
      this.dishType, 
      this.nexturl, 
      this.addonCat,});

  CategoryDishes.fromJson(dynamic json) {
    dishId = json['dish_id'];
    dishName = json['dish_name'];
    dishPrice = json['dish_price'];
    dishImage = json['dish_image'];
    dishCurrency = json['dish_currency'];
    dishCalories = json['dish_calories'];
    dishDescription = json['dish_description'];
    dishAvailability = json['dish_Availability'];
    dishType = json['dish_Type'];
    nexturl = json['nexturl'];
    if (json['addonCat'] != null) {
      addonCat = [];
      json['addonCat'].forEach((v) {
        addonCat?.add(AddonCat.fromJson(v));
      });
    }
  }
  String? dishId;
  String? dishName;
  double? dishPrice;
  String? dishImage;
  String? dishCurrency;
  double? dishCalories;
  String? dishDescription;
  bool? dishAvailability;
  int? dishType;
  String? nexturl;
  List<AddonCat>? addonCat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dish_id'] = dishId;
    map['dish_name'] = dishName;
    map['dish_price'] = dishPrice;
    map['dish_image'] = dishImage;
    map['dish_currency'] = dishCurrency;
    map['dish_calories'] = dishCalories;
    map['dish_description'] = dishDescription;
    map['dish_Availability'] = dishAvailability;
    map['dish_Type'] = dishType;
    map['nexturl'] = nexturl;
    if (addonCat != null) {
      map['addonCat'] = addonCat!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}