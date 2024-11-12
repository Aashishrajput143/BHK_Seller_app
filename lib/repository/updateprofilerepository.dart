import 'package:bhk_seller_app/model/updateprofilemodel.dart';
import '../data/app_url/app_url.dart';
import '../data/network/network_api_services.dart';

class UpdateprofileRepository {
  final _apiServices = NetworkApiServices();

  Future<UpdateProfileModel> updateprofileApi(var data, var path) async {
    dynamic response = await _apiServices.multiPartApi(
        data, AppUrl.updateprofile, path, "avatar");
    return UpdateProfileModel.fromJson(response);
  }
}
