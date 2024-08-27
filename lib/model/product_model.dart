class ProductResponse {
  String? status;
  List<ProductData>? data;

  ProductResponse({this.status, this.data});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductData {
  int? id;
  String? productName;
  String? description;
  String? price;
  String? image;
  int? userId;
  String? createdAt;
  String? updatedAt;
  User? user; // Added the User field

  ProductData({
    this.id,
    this.productName,
    this.description,
    this.price,
    this.image,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.user, // Initialized the User field
  });

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null
        ? User.fromJson(json['user'])
        : null; // Parse User object
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['productName'] = this.productName;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson(); // Convert User object to JSON
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? profileUrl;
  String? createdAt;
  String? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.profileUrl,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profileUrl = json['profile_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profile_url'] = this.profileUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
