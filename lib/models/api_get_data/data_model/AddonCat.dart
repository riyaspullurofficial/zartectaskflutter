import 'Addons.dart';

class AddonCat {
  AddonCat({
      this.addonCategory, 
      this.addonCategoryId, 
      this.addonSelection, 
      this.nexturl, 
      this.addons,});

  AddonCat.fromJson(dynamic json) {
    addonCategory = json['addon_category'];
    addonCategoryId = json['addon_category_id'];
    addonSelection = json['addon_selection'];
    nexturl = json['nexturl'];
    if (json['addons'] != null) {
      addons = [];
      json['addons'].forEach((v) {
        addons?.add(Addons.fromJson(v));
      });
    }
  }
  String? addonCategory;
  String? addonCategoryId;
  int? addonSelection;
  String? nexturl;
  List<Addons>? addons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['addon_category'] = addonCategory;
    map['addon_category_id'] = addonCategoryId;
    map['addon_selection'] = addonSelection;
    map['nexturl'] = nexturl;
    if (addons != null) {
      map['addons'] = addons!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}