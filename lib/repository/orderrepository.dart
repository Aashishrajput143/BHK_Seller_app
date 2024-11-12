import 'package:bhk_seller_app/data/app_url/app_url.dart';
import 'package:bhk_seller_app/data/network/network_api_services.dart';
import 'package:bhk_seller_app/model/ordersmodel.dart';

class OrderRepository {
  final _apiServices = NetworkApiServices();

  Future<GetOrdersModel> getorderApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.orders);
    return GetOrdersModel.fromJson(response);
  }
}
