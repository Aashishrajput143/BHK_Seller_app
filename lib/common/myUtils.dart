import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/component/authentication_exception.dart';
import '../resources/component/general_exception.dart';
import '../resources/component/internet_exception_widget.dart';

Visibility progressBarTransparent(value, h, w) {
  return Visibility(
    visible: value,
    child: Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.black.withOpacity(0.6),
          Colors.black.withOpacity(0.8),
        ],
      )),
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
          backgroundColor: Colors.transparent,
        ),
      ),
    ),
  );
}

Visibility progressBarTransparentWithOpacity(value, h, w) {
  return Visibility(
    visible: value,
    child: Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
      ),
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.black,
          backgroundColor: Colors.transparent,
        ),
      ),
    ),
  );
}

Visibility internetException(value, onPress) {
  return Visibility(
      visible: value,
      child: InternetExceptionWidget(
        onPress: onPress,
      ));
}

Visibility generalException(value, onPress) {
  return Visibility(
      visible: value,
      child: GeneralExceptionWidget(
        onPress: onPress,
      ));
}

Visibility authentication(value) {
  return Visibility(visible: value, child: AuthenticationExceptionWidget());
}
