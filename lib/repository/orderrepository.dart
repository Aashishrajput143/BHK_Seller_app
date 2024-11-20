import 'package:bhk_seller_app/data/app_url/app_url.dart';
import 'package:bhk_seller_app/data/network/network_api_services.dart';
import 'package:bhk_seller_app/model/ordersmodel.dart';
import 'package:bhk_seller_app/model/todayordermodel.dart';

class OrderRepository {
  final _apiServices = NetworkApiServices();

  Future<GetOrdersModel> getorderApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.orders);
    return GetOrdersModel.fromJson(response);
  }

  Future<TodayOrdersModel> gettodayorderApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.todayorder);
    return TodayOrdersModel.fromJson(response);
  }
}
