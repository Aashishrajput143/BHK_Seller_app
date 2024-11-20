class GetOrdersModel {
  String? message;
  List<Data>? data;

  GetOrdersModel({this.message, this.data});

  GetOrdersModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? orderItemId;
  int? variantId;
  String? price;
  String? discount;
  int? quantity;
  int? userId;
  String? productName;
  int? productId;

  Data(
      {this.orderItemId,
      this.variantId,
      this.price,
      this.discount,
      this.quantity,
      this.userId,
      this.productName,
      this.productId});

  Data.fromJson(Map<String, dynamic> json) {
    orderItemId = json['orderItemId'];
    variantId = json['variantId'];
    price = json['price'];
    discount = json['discount'];
    quantity = json['quantity'];
    userId = json['userId'];
    productName = json['productName'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderItemId'] = this.orderItemId;
    data['variantId'] = this.variantId;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['quantity'] = this.quantity;
    data['userId'] = this.userId;
    data['productName'] = this.productName;
    data['productId'] = this.productId;
    return data;
  }
}
