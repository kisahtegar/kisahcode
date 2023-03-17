import 'package:flutter/material.dart';

/// This widget is made to set responsive on different device sizes
class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? mobileLarge;
  final Widget? tablet;
  final Widget? tabletLarge;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    this.tabletLarge,
    required this.desktop,
    this.mobileLarge,
  }) : super(key: key);

  /// if `isMobile` screen width <= 500
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 500;

  /// if `isMobileLarge` screen width <= 700
  static bool isMobileLarge(BuildContext context) =>
      MediaQuery.of(context).size.width <= 700;

  /// if `isTablet` screen width < 1024
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1024;

  /// if `isTabletLargeG` screen width >= 1024
  static bool isTabletLargeG(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  /// if `isTabletLarge` screen width < 1024
  static bool isTabletLarge(BuildContext context) =>
      MediaQuery.of(context).size.width < 1200;

  /// if `isDesktop` screen width >= 1024
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= 1200) {
      return desktop;
    } else if (size.width >= 1024 && tabletLarge != null) {
      return tabletLarge!;
    } else if (size.width >= 700 && tablet != null) {
      return tablet!;
    } else if (size.width >= 500 && mobileLarge != null) {
      return mobileLarge!;
    } else {
      return mobile;
    }
  }
}
