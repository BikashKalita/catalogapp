// ignore_for_file: prefer_const_constructors

import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/pages/cart.dart';
import 'package:catalog_app/pages/home.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      initialRoute: MyRoute.home,
      routes: {
        MyRoute.home: (context) => HomePage(),
        MyRoute.cart: (context) => CartPage()
      },
    );
  }
}
