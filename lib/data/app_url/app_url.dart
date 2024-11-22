class AppUrl {
  //Development
  //static const String baseUrl = 'https://php8.singsys.net/gis/server/public/api';

  //Staging
  static const String baseUrl = 'http://192.168.31.204:8087';
  static const String baseUrl2 = 'http://192.168.31.204:8000';
  static const String baseUrl3 = 'http://192.168.31.204:8086';

  //Authenication
  static String register = '$baseUrl/api/user/register';
  static String login = '$baseUrl2/api/auth/loginOrRegister';
  static String verifyOtp = '$baseUrl2/api/auth/verify';
  static String logout = '$baseUrl2/api/logout/allSession';
  static String loggedinuser = '$baseUrl3/api/users/userdetails';
  static String updateprofile = '$baseUrl3/api/users/updateprofile';

  //get
  static String getcategory =
      '$baseUrl/api/category/getallcategory?page=1&pageSize=10';
  static String getsubcategory = '$baseUrl/api/category/getsubcategory/';
  static String getbrand = '$baseUrl/api/brand/getall?page=';
  static String getbranddetails = '$baseUrl/api/brand/getby/';
  static String getstoredetails = '$baseUrl/api/store/getby/';
  static String getstore = '$baseUrl/api/store/getall?page=';
  static String getproductlisting = '$baseUrl/api/product/productlisting';
  static String getproduct = '$baseUrl/api/product/productdetails/';
  static String orders = '$baseUrl/api/order/totalorder';
  static String todayorder = '$baseUrl/api/order/todayorder';
  static String salesgraph = '$baseUrl/api/order/totalsales?year=';

  //post
  static String addbrand = '$baseUrl/api/brand/add';
  static String addstore = '$baseUrl/api/store/addstore';
  static String addproduct = '$baseUrl/api/product/addproduct';
  static String addproductmedia = '$baseUrl/api/product/addorupdatemedia';
}
