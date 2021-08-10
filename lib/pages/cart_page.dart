import 'package:flutter/material.dart';
import 'package:sasta_app/core/store.dart';
import 'package:sasta_app/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(context.cardColor).make(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel? _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 125,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
              builder: (context, store, VxStatus? _) {
                return "\$${_cart!.totalPrice()}"
                    .text
                    .xl5
                    .color(context.cardColor)
                    .make();
              },
              mutations: {RemoveMutation},
              notifications: {}),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Buying Not supported yet.".text.make(),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                context.theme.buttonColor,
              ),
            ),
            child: "Buy".text.color(Colors.white).make(),
          ).w20(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  final CartModel? _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return _cart!.item.isEmpty
        ? "Nothing to Show".text.xl3.color(context.cardColor).makeCentered()
        : ListView.builder(
            itemCount: _cart!.item.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(
                Icons.done,
              ),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () => RemoveMutation(_cart!.item[index]),
              ),
              title: _cart!.item[index].name.text.make(),
            ),
          );
  }
}
