import 'package:bhk_seller_app/data/app_url/app_url.dart';
import 'package:bhk_seller_app/data/network/network_api_services.dart';
import 'package:bhk_seller_app/model/salesgraphmodel.dart';

class SalesRepository {
  final _apiServices = NetworkApiServices();

  Future<SalesGraphModel> getsalesApi(var year) async {
    dynamic response = await _apiServices.getApi("${AppUrl.salesgraph}$year");
    return SalesGraphModel.fromJson(response);
  }
}
