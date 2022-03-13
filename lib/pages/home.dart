// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
// import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 1));
    var products = await rootBundle.loadString('assets/files/catalog.json');
    var decodedProduct = jsonDecode(products);
    var productsData = decodedProduct["products"];

    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: VxBuilder(
        builder: (context, store, status) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoute.cart),
          child: Icon(CupertinoIcons.cart),
          backgroundColor: MyTheme.darkBluishColor,
        ).badge(
            count: _cart.items.length,
            size: 22,
            textStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
        mutations: {AddMutation},
      ),
      body: SafeArea(
          child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CatalogHeader().py(16),
                  if (CatalogModel.items != null)
                    CatalogList().expand()
                  else
                    Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                ],
              ))),
    );
  }
}
