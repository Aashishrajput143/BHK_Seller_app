class AddStoreModel {
  String? message;
  Data? data;

  AddStoreModel({this.message, this.data});

  AddStoreModel.fromJson(Map<String, dynamic> json) {
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
  int? storeId;
  String? storeName;
  String? description;
  bool? isActive;
  String? status;
  String? createdAt;
  String? updatedAt;
  Address? address;

  Data(
      {this.storeId,
      this.storeName,
      this.description,
      this.isActive,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.address});

  Data.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    storeName = json['store_name'];
    description = json['description'];
    isActive = json['isActive'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = this.storeId;
    data['store_name'] = this.storeName;
    data['description'] = this.description;
    data['isActive'] = this.isActive;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class Address {
  int? id;
  String? createdAt;
  bool? isDefault;
  String? street;
  String? houseNo;
  String? postalCode;
  String? city;
  String? country;
  String? state;
  String? addressType;

  Address(
      {this.id,
      this.createdAt,
      this.isDefault,
      this.street,
      this.houseNo,
      this.postalCode,
      this.city,
      this.country,
      this.state,
      this.addressType});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    isDefault = json['isDefault'];
    street = json['street'];
    houseNo = json['houseNo'];
    postalCode = json['postalCode'];
    city = json['city'];
    country = json['country'];
    state = json['state'];
    addressType = json['addressType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['isDefault'] = this.isDefault;
    data['street'] = this.street;
    data['houseNo'] = this.houseNo;
    data['postalCode'] = this.postalCode;
    data['city'] = this.city;
    data['country'] = this.country;
    data['state'] = this.state;
    data['addressType'] = this.addressType;
    return data;
  }
}
