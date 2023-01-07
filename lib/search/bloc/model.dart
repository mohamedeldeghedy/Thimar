class SearchModel {

  late final String status;
  late final String message;
  late final SearchData data;

  SearchModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = SearchData.fromJson(json['data']);
  }

}

class SearchData {

  late final List<SearchResult> searchResult;

  SearchData.fromJson(Map<String, dynamic> json){
    searchResult = List.from(json['search_result']).map((e)=>SearchResult.fromJson(e)).toList();
  }

}

class SearchResult {
  SearchResult({
    required this.categoryId,
    required this.id,
    required this.title,
    required this.description,
    required this.code,
    required this.priceBeforeDiscount,
    required this.price,
    required this.discount,
    required this.amount,
    required this.isActive,
    required this.isFavorite,
    required this.unit,
    required this.images,
    required this.mainImage,
    required this.createdAt,
  });
  late final int categoryId;
  late final int id;
  late final String title;
  late final String description;
  late final String code;
  late final int priceBeforeDiscount;
  late final num? price;
  late final double discount;
  late final int amount;
  late final int isActive;
  late final bool isFavorite;
  late final Unit unit;
  late final List<Images> images;
  late final String mainImage;
  late final String createdAt;

  SearchResult.fromJson(Map<String, dynamic> json){
    categoryId = json['category_id'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    code = json['code'];
    priceBeforeDiscount = json['price_before_discount'];
    price = json['price']??0;
    discount = json['discount'];
    amount = json['amount'];
    isActive = json['is_active'];
    isFavorite = json['is_favorite'];
    unit = Unit.fromJson(json['unit']);
    images = List.from(json['images']).map((e)=>Images.fromJson(e)).toList();
    mainImage = json['main_image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_id'] = categoryId;
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['code'] = code;
    _data['price_before_discount'] = priceBeforeDiscount;
    _data['price'] = price;
    _data['discount'] = discount;
    _data['amount'] = amount;
    _data['is_active'] = isActive;
    _data['is_favorite'] = isFavorite;
    _data['unit'] = unit.toJson();
    _data['images'] = images.map((e)=>e.toJson()).toList();
    _data['main_image'] = mainImage;
    _data['created_at'] = createdAt;
    return _data;
  }
}

class Unit {
  Unit({
    required this.id,
    required this.name,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String type;
  late final String createdAt;
  late final String updatedAt;

  Unit.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['type'] = type;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Images {
  Images({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Images.fromJson(Map<String, dynamic> json){
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}