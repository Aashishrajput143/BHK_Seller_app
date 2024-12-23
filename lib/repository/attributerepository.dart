import 'package:bhk_seller_app/data/app_url/app_url.dart';
import 'package:bhk_seller_app/data/network/network_api_services.dart';
import 'package:bhk_seller_app/model/colormodel.dart';
import 'package:bhk_seller_app/model/sizemodel.dart';

class AttributeRepository {
  final _apiServices = NetworkApiServices();

  Future<GetColorsModel> getcolorApi() async {
    dynamic response = await _apiServices.getApi("${AppUrl.color}/color");
    return GetColorsModel.fromJson(response);
  }

  Future<GetSizeModel> getsizeApi() async {
    dynamic response = await _apiServices.getApi("${AppUrl.color}/size");
    return GetSizeModel.fromJson(response);
  }
}
