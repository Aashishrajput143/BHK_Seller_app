class AppImages {
  static get logo => 'assets/images/logo.png';
  static get product1 => 'assets/images/Product1.jpg';
  static get product2 => 'assets/images/Product2.jpg';
  static get product3 => 'assets/images/Product3.png';
  static get product4 => 'assets/images/Product4.jpeg';
  static get product5 => 'assets/images/Product5.jpeg';
  static get product6 => 'assets/images/Product6.jpeg';
  static get product7 => 'assets/images/Product7.jpeg';
  static get product8 => 'assets/images/Product8.jpg';
  static get googleicon => 'assets/images/google_icon.png';
  static get bhkbackground => 'assets/images/BHKbacground.jpg';
  static get profile => 'assets/images/Profile.png';
  static get myproductcart => 'assets/images/myproductcart.gif';
  static get orderscreen => 'assets/images/orderscreen.gif';
  static get firstbrand => 'assets/images/firstbrand.gif';
  static get storeimage => 'assets/images/storeimage.png';
  static get firststock => 'assets/images/firststock.gif';
  static get loader => 'assets/images/loader.gif';
  static get loader1 => 'assets/images/loader1.gif';

  static final AppImages _appImages = AppImages._internal();
  factory AppImages() {
    return _appImages;
  }
  AppImages._internal();
}

AppImages appImages = AppImages();
