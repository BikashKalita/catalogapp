import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import 'add_to_cart.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items?.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items![index];
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsPage(catalog: catalog))),
              child: CatalogItem(catalog: catalog));
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Text(catalog.name!),
    // );
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image!)),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              catalog.name!.text.bold.lg
                  .color(Theme.of(context).colorScheme.secondary)
                  .make(),
              catalog.desc!.text
                  .caption(context)
                  .color(Theme.of(context).colorScheme.secondary)
                  .make(),
              SizedBox(height: 10.0),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price.toString()}"
                      .text
                      .bold
                      .xl
                      .color(Theme.of(context).colorScheme.secondary)
                      .make(),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: AddToCart(catalog: catalog)),
                ],
              )
            ],
          ))
        ],
      ),
    ).color(Theme.of(context).cardColor).rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .color(Theme.of(context).canvasColor)
        .rounded
        .make()
        .p16()
        .w40(context);
  }
}
