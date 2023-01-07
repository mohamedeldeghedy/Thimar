class ProductDetailsModel {
  late final String status;
  late final String message;
  late final ProductData? data;

  ProductDetailsModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = (json['data']!=null?ProductData.fromJson(json['data']):"") as ProductData?;
  }
}

class ProductData {
  late final int categoryId;
  late final int id;
  late final String title;
  late final String description;
  late final String code;
  late final int priceBeforeDiscount;
  late final int price;
  late final double discount;
  late final int amount;
  late final int isActive;
  late final bool isFavorite;
  late final Unit unit;
  late  List<Carousal> images=[];
  late final String mainImage;
  late final String createdAt;

  ProductData.fromJson(Map<String, dynamic> json){
    categoryId = json['category_id']??0;
    id = json['id']??0;
    title = json['title']??'';
    description = json['description']??'';
    code = json['code']??'';
    priceBeforeDiscount = json['price_before_discount']??0;
    price = json['price']??0;
    discount = json['discount']??0;
    amount = json['amount']??0;
    isActive = json['is_active']??0;
    isFavorite=json['is_favorite']??false;
     Unit.fromJson(json['unit']??{});
    json['images'] !=null?json['images'].forEach((element)
    {
      images.add(Carousal.fromJson(element));
    }):{};
    // images = List.castFrom<dynamic, dynamic>(json['images']??{});
    mainImage = json['main_image']??'';
    createdAt = json['created_at']??'';
  }

}

class Unit {
  late final int id;
  late final String name;
  late final String type;
  late final String createdAt;
  late final String updatedAt;

  Unit.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    name = json['name']??'';
    type = json['type']??'';
    createdAt = json['created_at']??'';
    updatedAt = json['updated_at']??'';
  }

}
class Carousal {
  late final String name;
  late final String url;
  Carousal.fromJson(Map<String, dynamic> json){
    name = json['name']??'';
    url = json['url']??'';
  }
}