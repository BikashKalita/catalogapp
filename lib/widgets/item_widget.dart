// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:catalog_app/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item? item;
  const ItemWidget({Key? key, @required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (() {
          print("${item!.name!} Pressed");
        }),
        leading: Image.network(item!.image!),
        title: Text(item!.name!),
        subtitle: Text(item!.desc!),
        trailing: Text(
          "\$${item!.price.toString()}",
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
          // textScaleFactor: 1.2,
        ), //string interpolation /$
      ),
    );
  }
}
