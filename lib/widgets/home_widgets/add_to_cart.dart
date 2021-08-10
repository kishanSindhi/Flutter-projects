import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sasta_app/core/store.dart';
import 'package:sasta_app/models/cart.dart';
import 'package:sasta_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddTOCart extends StatelessWidget {
  final Item catalog;
  AddTOCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel? _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart!.item.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
