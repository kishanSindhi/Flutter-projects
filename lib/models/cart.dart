import 'package:sasta_app/core/store.dart';
import 'package:sasta_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // catalog fields
  CatalogueModels? _catalog;

  // collection of IDs - Store IDs of each items
  final List<int> _itemIDs = [];

  // get catalog
  CatalogueModels? get catalog => _catalog;

  set catalog(CatalogueModels? newCatalog) {
    _catalog = newCatalog!;
  }

  // get items in the cart
  List<Item> get item => _itemIDs.map((id) => catalog!.getById(id)).toList();

  // Get total price
  num totalPrice() => item.fold(0, (total, current) => total + current.price);
}

// add item

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart!._itemIDs.add(item.id);
  }
}

// remove item
class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart!._itemIDs.remove(item.id);
  }
}
