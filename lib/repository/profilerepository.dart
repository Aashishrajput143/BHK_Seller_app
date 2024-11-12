import 'package:bhk_seller_app/data/app_url/app_url.dart';
import 'package:bhk_seller_app/data/network/network_api_services.dart';
import 'package:bhk_seller_app/model/getprofilemodel.dart';

class ProfileRepository {
  final _apiServices = NetworkApiServices();

  Future<GetProfileModel> getprofileApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.loggedinuser);
    return GetProfileModel.fromJson(response);
  }
}
