import 'package:bhk_seller_app/data/app_url/app_url.dart';
import 'package:bhk_seller_app/data/network/network_api_services.dart';
import 'package:bhk_seller_app/model/addproductmediamodel.dart';
import 'package:bhk_seller_app/model/addproductmodel.dart';
import 'package:bhk_seller_app/model/getbrandModel.dart';
import 'package:bhk_seller_app/model/getcategorymodel.dart';
import 'package:bhk_seller_app/model/getproductmodel.dart';
import 'package:bhk_seller_app/model/getstoremodel.dart';
import 'package:bhk_seller_app/model/getsubcategorymodel.dart';
import 'package:bhk_seller_app/model/productdetailsmodel.dart';

class ProductRepository {
  final _apiServices = NetworkApiServices();

  Future<GetCategoryModel> getcategoryApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.getcategory);
    return GetCategoryModel.fromJson(response);
  }

  Future<GetSubCategoryModel> getsubcategoryApi(cateId) async {
    dynamic response =
        await _apiServices.getApi("${AppUrl.getsubcategory}$cateId");
    return GetSubCategoryModel.fromJson(response);
  }

  Future<GetBrandModel> getbrandApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.getbrand);
    return GetBrandModel.fromJson(response);
  }

  Future<GetStoreModel> getstoreApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.getstore);
    return GetStoreModel.fromJson(response);
  }

  Future<AddProductModel> addproductApi(var data) async {
    dynamic response =
        await _apiServices.postEncodeApi(data, AppUrl.addproduct);
    return AddProductModel.fromJson(response);
  }

  Future<AddProductMediaModel> addproductmediaApi(
      var data, List<String> paths, List<String> keys) async {
    dynamic response = await _apiServices.multiPartMediaApi(
        data, AppUrl.addproductmedia, paths, keys);
    return AddProductMediaModel.fromJson(response);
  }

  Future<GetProductModel> getproductApi() async {
    dynamic response =
        await _apiServices.getApi("${AppUrl.getproductlisting}?isSeller=true");
    return GetProductModel.fromJson(response);
  }

  Future<ProductDetailsModel> getproductdetailsApi(productId) async {
    dynamic response =
        await _apiServices.getApi("${AppUrl.getproduct}$productId");
    return ProductDetailsModel.fromJson(response);
  }
}
