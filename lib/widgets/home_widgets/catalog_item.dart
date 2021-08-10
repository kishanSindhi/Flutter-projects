// this file also contain button

import 'package:flutter/material.dart';
import 'package:sasta_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.bold.xl2.color(context.accentColor).make(),
                catalog.description.text.color(context.accentColor).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    '\$ ${catalog.price}'.text.bold.xl.make(),
                    AddTOCart(catalog: catalog),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ).color(context.theme.dividerColor).rounded.square(150.0).make().py16();
  }
}
