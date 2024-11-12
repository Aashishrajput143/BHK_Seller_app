class BrandDetailsModel {
  String? message;
  Data? data;

  BrandDetailsModel({this.message, this.data});

  BrandDetailsModel.fromJson(Map<String, dynamic> json) {
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
  int? brandId;
  String? brandName;
  String? brandLogo;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;
  bool? isActive;

  Data(
      {this.brandId,
      this.brandName,
      this.brandLogo,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    brandName = json['brand_name'];
    brandLogo = json['brand_logo'];
    description = json['description'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_id'] = this.brandId;
    data['brand_name'] = this.brandName;
    data['brand_logo'] = this.brandLogo;
    data['description'] = this.description;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['isActive'] = this.isActive;
    return data;
  }
}
