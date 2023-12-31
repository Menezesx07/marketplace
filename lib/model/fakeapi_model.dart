class FakeApiListModel {

  List<FakeApiItem> results = [];

  FakeApiListModel(this.results);

  FakeApiListModel.fromJson(List<dynamic> jsonList) {
    results = jsonList.map((item) => FakeApiItem.fromJson(item)).toList();
  }

  List<Map<String, dynamic>> toJson() {
    return results.map((item) => item.toJson()).toList();
  }
}

class FakeApiItem {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  int qnty = 1;

  FakeApiItem({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
    required this.qnty
  });

  FakeApiItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price']?.toDouble();
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate']?.toDouble();
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}
