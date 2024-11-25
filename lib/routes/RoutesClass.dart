import 'package:bhk_seller_app/binding/signupbinding.dart';
import 'package:bhk_seller_app/resources/commonDash.dart';
import 'package:bhk_seller_app/screens/Termsconditions.dart.dart';
import 'package:bhk_seller_app/screens/brandManagement/brand_details.dart';
import 'package:bhk_seller_app/screens/changepassword.dart';
import 'package:bhk_seller_app/screens/dashboardManagement/notifications.dart';
import 'package:bhk_seller_app/screens/brandManagement/add_brand.dart';
import 'package:bhk_seller_app/screens/brandManagement/my_brands.dart';
import 'package:bhk_seller_app/screens/faq.dart';
import 'package:bhk_seller_app/screens/ordersManagement/orderdetails.dart';
import 'package:bhk_seller_app/screens/privacypolicy.dart';
import 'package:bhk_seller_app/screens/profileManagement/edit_profile_screen.dart';
import 'package:bhk_seller_app/screens/productManagement/add_productdetails.dart';
import 'package:bhk_seller_app/screens/productManagement/add_productfiles.dart';
import 'package:bhk_seller_app/screens/productManagement/add_productgeneral.dart';
import 'package:bhk_seller_app/screens/productManagement/productpreview.dart';
import 'package:bhk_seller_app/screens/profileManagement/settingprofile.dart';
import 'package:bhk_seller_app/screens/profileManagement/view_profile.dart';
import 'package:bhk_seller_app/screens/splashScreen.dart';
import 'package:bhk_seller_app/screens/storeManagement/add_store.dart';
import 'package:bhk_seller_app/screens/storeManagement/my_store.dart';
import 'package:bhk_seller_app/screens/storeManagement/store_details.dart';
import 'package:get/get.dart';

import '../binding/loginbinding.dart';
import '../screens/login_screen.dart';
import '../screens/otpScreen.dart';
import '../screens/registration_screen.dart';

class RoutesClass {
  //BR1
  static String splash = '/splash';
  static String dashboard = '/dashboard';
  static String signUp = '/signUp';
  static String forgotPassword = '/forgotPassword';
  static String login = '/login';
  static String verify = '/verify';
  static String brands = '/brands';
  static String addbrands = '/addbrands';
  static String branddetail = '/branddetail';
  static String stores = '/stores';
  static String addstores = '/addstores';
  static String storedetail = '/storedetail';
  static String products = '/products';
  static String addproducts = '/addproducts';
  static String addproductdetails = '/addproductdetails';
  static String addproductmedia = '/addproductmedia';
  static String orders = '/orders';
  static String profile = '/profile';
  static String notifications = '/notifications';
  static String changepassword = '/changepassword';
  static String setting = '/setting';
  static String editprofile = '/editprofile';
  static String viewprofile = '/viewprofile';
  static String productdetail = '/productdetail';
  static String ordersdetails = '/ordersdetails';
  static String termscondition = '/termscondition';
  static String privacypolicy = '/privacypolicy';
  static String faq = '/faq';

  //BR1
  static String gotoSplash() => splash;
  static String gotoDashboardScreen() => dashboard;
  static String gotoLoginScreen() => login;
  static String gotoForgotPassword() => forgotPassword;
  static String gotoSignUpScreen() => signUp;
  static String gotoVerifyScreen() => verify;
  static String gotoBrandScreen() => brands;
  static String gotoaddBrandScreen() => addbrands;
  static String gotoBrandDetailsScreen() => branddetail;
  static String gotoStoreScreen() => stores;
  static String gotoaddStoreScreen() => addstores;
  static String gotoStoreDetailsScreen() => storedetail;
  static String gotoProductScreen() => products;
  static String gotoaddProductScreen() => addproducts;
  static String gotoaddProductdetailsScreen() => addproductdetails;
  static String gotoaddProductmediaScreen() => addproductmedia;
  static String gotoOrderScreen() => orders;
  static String gotoOrderDetailsScreen() => ordersdetails;
  static String gotoProfileScreen() => profile;
  static String gotoNotificationScreen() => notifications;
  static String gotoChangePasswordScreen() => changepassword;
  static String gotoSettingScreen() => setting;
  static String gotoEditProfileScreen() => editprofile;
  static String gotoViewProfileScreen() => viewprofile;
  static String gotoProductDetailScreen() => productdetail;
  static String gotoTermsConditionScreen() => termscondition;
  static String gotoPrivacyPolicyScreen() => privacypolicy;
  static String gotoFAQScreen() => faq;
  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
        name: login,
        page: () => LoginScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 300),
        binding: LoginBinding()),
    GetPage(
      name: dashboard,
      page: () => const CommonDash(index: 0),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
        name: signUp,
        page: () => RegistrationScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 300),
        binding: SignupBinding()),
    GetPage(
      name: verify,
      page: () => Otpscreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: brands,
      page: () => const MyBrands(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: addbrands,
      page: () => const AddBrand(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: branddetail,
      page: () => const MyBrandDetails(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: stores,
      page: () => const MyStores(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: addstores,
      page: () => const AddStore(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: storedetail,
      page: () => const MyStoreDetails(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: products,
      page: () => const CommonDash(index: 1),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: addproducts,
      page: () => const AddProductPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: addproductdetails,
      page: () => const AddProductDetails(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: addproductmedia,
      page: () => AddProductfiles(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: orders,
      page: () => const CommonDash(index: 2),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: ordersdetails,
      page: () => OrderDetailsPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: profile,
      page: () => const CommonDash(index: 3),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: notifications,
      page: () => const Notifications(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: changepassword,
      page: () => Changepassword(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: setting,
      page: () => SettingProfile(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: viewprofile,
      page: () => ViewProfile(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: editprofile,
      page: () => EditProfile(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: productdetail,
      page: () => ProductPreview(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: termscondition,
      page: () => TermsConditions(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: privacypolicy,
      page: () => PrivacyPolicy(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: faq,
      page: () => FAQ(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}

class LoginBindings {}
