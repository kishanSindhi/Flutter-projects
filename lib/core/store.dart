import 'package:sasta_app/models/cart.dart';
import 'package:sasta_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogueModels? catalog;
  CartModel? cart;
  MyStore() {
    catalog = CatalogueModels();
    cart = CartModel();
    cart!.catalog = catalog;
  }
}
