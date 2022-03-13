import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        "CatalogApp"
            .text
            .xl4
            .bold
            .color(Theme.of(context).colorScheme.secondary)
            .make(),
        "Trending Products"
            .text
            .color(Theme.of(context).colorScheme.secondary)
            .xl2
            .make()
      ],
    );
  }
}
