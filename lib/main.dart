import 'package:flutter/material.dart';
import 'AppRoutes.dart';

void main() {
  runApp(MaterialApp(
debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF00BCD4),
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    ),
    initialRoute: AppRoutes.homePage,
    routes: AppRoutes().define(),
  ));
}
