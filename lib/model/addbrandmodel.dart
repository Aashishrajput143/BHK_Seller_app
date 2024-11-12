class AddBrandModel {
  String? message;
  Data? data;

  AddBrandModel({this.message, this.data});

  AddBrandModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? brandName;
  String? brandLogo;
  String? description;
  String? status;
  User? user;
  int? brandId;
  String? createdAt;
  String? updatedAt;
  bool? isActive;

  Data(
      {this.brandName,
      this.brandLogo,
      this.description,
      this.status,
      this.user,
      this.brandId,
      this.createdAt,
      this.updatedAt,
      this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    brandName = json['brand_name'];
    brandLogo = json['brand_logo'];
    description = json['description'];
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    brandId = json['brand_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_name'] = this.brandName;
    data['brand_logo'] = this.brandLogo;
    data['description'] = this.description;
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['brand_id'] = this.brandId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['isActive'] = this.isActive;
    return data;
  }
}

class User {
  int? id;

  User({this.id});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
