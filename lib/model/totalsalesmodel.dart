class TotalSalesModel {
  String? message;
  Data? data;

  TotalSalesModel({this.message, this.data});

  TotalSalesModel.fromJson(Map<String, dynamic> json) {
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
  int? totalSales;

  Data({this.totalSales});

  Data.fromJson(Map<String, dynamic> json) {
    totalSales = json['Total Sales'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Total Sales'] = this.totalSales;
    return data;
  }
}
