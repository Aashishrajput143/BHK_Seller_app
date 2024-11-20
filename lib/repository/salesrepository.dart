import 'package:bhk_seller_app/data/app_url/app_url.dart';
import 'package:bhk_seller_app/data/network/network_api_services.dart';

import 'package:bhk_seller_app/model/totalsalesmodel.dart';

class SalesRepository {
  final _apiServices = NetworkApiServices();

  Future<TotalSalesModel> gettotalsalesApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.totalsales);
    return TotalSalesModel.fromJson(response);
  }
}
