class ShowBuyID {
  String? status;
  Data? data;

  ShowBuyID({this.status, this.data});

  factory ShowBuyID.fromJson(Map<String, dynamic> json) {
    return ShowBuyID(
      status: json['status'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? productName;
  String? description;
  String? price;
  String? image;
  int? userId;
  String? createdAt;
  String? updatedAt;
  bool? buyOrder;
  int? buyCount;
  User? user;
  List<dynamic>? buy;

  Data({
    this.id,
    this.productName,
    this.description,
    this.price,
    this.image,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.buyOrder,
    this.buyCount,
    this.user,
    this.buy,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      productName: json['productName'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      buyOrder: json['buy_order'],
      buyCount: json['buy_count'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      buy: json['buy'] != null ? List<dynamic>.from(json['buy']) : null,
    );
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
    data['buy_order'] = this.buyOrder;
    data['buy_count'] = this.buyCount;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.buy != null) {
      data['buy'] =
          this.buy; // Assuming the items in the list can be serialized directly
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt; // Changed type from Null to String?
  String? profileUrl;
  String? createdAt;
  String? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.profileUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      profileUrl: json['profile_url'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['profile_url'] = this.profileUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
