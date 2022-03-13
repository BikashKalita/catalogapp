import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({Key? key, required this.catalog}) : super(key: key);

  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalog);
          }
        },
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
            shape: MaterialStateProperty.all(StadiumBorder())));
  }
}
