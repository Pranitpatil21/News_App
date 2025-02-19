import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'views/main_screen.dart';

void main() {
  runApp(GetMaterialApp(
    home: ResponsiveApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class ResponsiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return ScreenTypeLayout(
      mobile: MainScreen(),
      tablet: Center(child: Text("Tablet UI Coming Soon...")),
      desktop: Center(child: Text("Desktop UI Coming Soon...")),
    );
  }
}
