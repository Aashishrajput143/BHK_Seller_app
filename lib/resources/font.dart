class AppFonts {



  static final AppFonts appFonts =  AppFonts._internal();
  factory AppFonts() {
    return appFonts;
  }
  AppFonts._internal();

  get muliLang => 'MULI-LIGHT';

}
AppFonts appFonts =  AppFonts();
