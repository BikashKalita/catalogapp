import 'package:catalog_app/widgets/home_widgets/add_to_cart.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class DetailsPage extends StatelessWidget {
  final Item catalog;
  const DetailsPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: EdgeInsets.all(32),
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price.toString()}"
                  .text
                  .bold
                  .xl4
                  .color(Theme.of(context).colorScheme.secondary)
                  .make(),
              AddToCart(catalog: catalog).w(150).h(50)
            ],
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Padding(
                        padding: EdgeInsets.all(26),
                        child: Image.network(catalog.image!)))
                .h32(context),
            Expanded(
                child: VxArc(
              height: 10.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                width: context.screenWidth,
                color: Theme.of(context).cardColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 42),
                  child: Column(
                    children: [
                      catalog.name!.text.bold.xl4
                          .color(Theme.of(context).colorScheme.secondary)
                          .make(),
                      catalog.desc!.text.xl
                          .caption(context)
                          .color(Theme.of(context).colorScheme.secondary)
                          .make(),
                      SizedBox(
                        height: 10,
                      ),
                      "As part of our efforts to reach our environmental goals, iPhone 13 Pro and iPhone 13 Pro Max do not include a power adapter or EarPods. Included in the box is a USB‑C to Lightning Cable that supports fast charging and is compatible with USB‑C power adapters and computer ports."
                          .text
                          .caption(context)
                          .color(Theme.of(context).colorScheme.secondary)
                          .make()
                          .px12()
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
