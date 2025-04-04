import 'package:flutter/material.dart';
extension MediaQueryExtension on MediaQueryData {
  bool get isMobile => size.width < 600;
  bool get isTablet => size.width >= 600 && size.width < 1200;
  bool get isDesktop => size.width >= 1200;
  bool get isSmallScreen => size.width < 800;
  bool get isMediumScreen => size.width >= 800 && size.width < 1200;
  bool get isLargeScreen => size.width >= 1200;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;
  double get screenWidth => size.width;
  double get screenHeight => size.height;
  double get aspectRatio => size.aspectRatio;
  double get textScaleFactor => textScaleFactor;
  double get devicePixelRatio => devicePixelRatio;
  EdgeInsets get padding => padding;
  EdgeInsets get viewInsets => viewInsets;
}
extension ContextExtension on BuildContext {
  Size get mediaQuery => MediaQuery.sizeOf(this);
  bool get isMobile => MediaQuery.of(this).isMobile;
  bool get isTablet => MediaQuery.of(this).isTablet;
  bool get isDesktop => MediaQuery.of(this).isDesktop;
  double get screenWidth => mediaQuery.width;
  double get screenHeight => mediaQuery.height;
  double get aspectRatio => mediaQuery.aspectRatio;
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
}