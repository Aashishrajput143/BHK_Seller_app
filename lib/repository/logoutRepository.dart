import 'package:bhk_seller_app/model/logoutmodel.dart';

import '../data/app_url/app_url.dart';
import '../data/network/network_api_services.dart';

class LogoutRepository {
  final _apiServices = NetworkApiServices();

  Future<LogoutModel> logoutApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.logout);
    return LogoutModel.fromJson(response);
  }
}
