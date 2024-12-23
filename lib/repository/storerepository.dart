import 'package:bhk_seller_app/data/app_url/app_url.dart';
import 'package:bhk_seller_app/data/network/network_api_services.dart';
import 'package:bhk_seller_app/model/addstoremodel.dart';
import 'package:bhk_seller_app/model/getstoremodel.dart';
import 'package:bhk_seller_app/model/storedetailsmodel.dart';

class StoreRepository {
  final _apiServices = NetworkApiServices();

  Future<AddStoreModel> addstoreApi(var data, var path) async {
    dynamic response = await _apiServices.multiPartApi(
        data, AppUrl.addstore, path, "store_logo");
    return AddStoreModel.fromJson(response);
  }

  Future<GetStoreModel> getstoreApi(var page) async {
    dynamic response =
        await _apiServices.getApi("${AppUrl.getstore}$page&pageSize=10");
    return GetStoreModel.fromJson(response);
  }

  Future<GetStoreDetailsModel> getstoredetailsApi(storeId) async {
    dynamic response =
        await _apiServices.getApi("${AppUrl.getstoredetails}$storeId");
    return GetStoreDetailsModel.fromJson(response);
  }
}
