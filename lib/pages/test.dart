// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/item_widget.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 5));
    var products = await rootBundle.loadString('assets/files/catalog.json');
    var decodedProduct = jsonDecode(products);
    var productsData = decodedProduct["products"];
    // print(decodedProduct["products"]);
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Catalog App")),
        drawer: Drawer(),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: CatalogModel.items != null
              ?
              // ListView.builder(
              //     itemCount: CatalogModel.items?.length,
              //     itemBuilder: (context, index) => ItemWidget(
              //       item: CatalogModel.items![index],
              //     ),
              //   )
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: CatalogModel.items?.length,
                  itemBuilder: (context, index) {
                    final item = CatalogModel.items![index];
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.antiAlias,
                      child: GridTile(
                        header: Text(item.name!),
                        child: Image.network(item.image!),
                        footer: Text(item.price.toString()),
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ));
  }
}
