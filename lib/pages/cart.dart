import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: "Cart".text.make(),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [CardList().p32().expand(), Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
              builder: (context, store, status) => "\$${_cart.finalPrice}"
                  .text
                  .xl4
                  .color(Theme.of(context).colorScheme.secondary)
                  .make(),
              mutations: {RemoveMutation},
              notifications: {}),
          SizedBox(
            width: 30,
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Payment not supported yet".text.make()));
            },
            child: "Buy".text.uppercase.make(),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.darkBluishColor)),
          ).w32(context)
        ],
      ),
    );
  }
}

class CardList extends StatefulWidget {
  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    final CatalogModel _catalog = (VxState.store as MyStore).catalog;
    return _cart.items.isEmpty
        ? "Noting to Show"
            .text
            .xl3
            .color(Theme.of(context).colorScheme.secondary)
            .makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                leading:
                    Icon(Icons.done, color: Theme.of(context).primaryColor),
                trailing: IconButton(
                  icon: Icon(
                    Icons.remove_circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    RemoveMutation(_cart.items[index]);
                  },
                ),
                title: "${_cart.items[index].name}"
                    .text
                    .color(Theme.of(context).colorScheme.secondary)
                    .make()),
          );
  }
}
