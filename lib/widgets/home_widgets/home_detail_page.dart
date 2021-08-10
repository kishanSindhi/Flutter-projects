import 'package:flutter/material.dart';
import 'package:sasta_app/models/catalog.dart';
import 'package:sasta_app/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetail extends StatelessWidget {
  final Item catalog;

  const HomeDetail({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.canvasColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            '\$ ${catalog.price}'.text.bold.xl4.color(Color(0xDFB71C1C)).make(),
            AddTOCart(
              catalog: catalog,
            ).wh(120.0, 50.0),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context).p8(),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: context.canvasColor,
                  child: Column(
                    children: [
                      catalog.name.text.bold.xl4
                          .color(context.accentColor)
                          .make(),
                      catalog.description.text.xl2
                          .color(context.accentColor)
                          .make(),
                      10.heightBox,
                      SingleChildScrollView(
                        child:
                            "This is a demo Text created by Kishan Sindhi. This is a very interesting product and you should buy it cos its vey cheap."
                                .text
                                .color(context.accentColor)
                                .make()
                                .px32()
                                .py16(),
                      )
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
