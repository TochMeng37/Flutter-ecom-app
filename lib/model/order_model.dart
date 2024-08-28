class DataResBuy {
  String? status;
  List<Product>? products;

  DataResBuy({this.status, this.products});

  DataResBuy.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        products = (json['products'] as List<dynamic>?)
            ?.map((item) => Product.fromJson(item))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (products != null) {
      data['products'] = products!.map((product) => product.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? id;
  String? productName;
  String? description;
  String? price;
  String? image;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Product({
    this.id,
    this.productName,
    this.description,
    this.price,
    this.image,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        productName = json['productName'],
        description = json['description'],
        price = json['price'],
        image = json['image'],
        userId = json['user_id'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productName'] = productName;
    data['description'] = description;
    data['price'] = price;
    data['image'] = image;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
