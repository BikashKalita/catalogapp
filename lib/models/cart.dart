import 'package:velocity_x/velocity_x.dart';

import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/catalog.dart';

class CartModel {
  late CatalogModel _catalog;

//List to store all ids
  final List<int> _itemIds = [];

//Get Method for Private
  CatalogModel get catalog => _catalog;

//Set Method
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

//Get cart item list
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

//Get total price
  num get finalPrice =>
      items.fold(0, (total, current) => total + current.price!);

//add items
  void add(Item item) {
    _itemIds.add(item.id!);
  }

//remove items

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id!);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id!);
  }
}
