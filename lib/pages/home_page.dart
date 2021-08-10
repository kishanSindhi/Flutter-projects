import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sasta_app/core/store.dart';
import 'package:sasta_app/models/cart.dart';
import 'package:sasta_app/models/catalog.dart';
import 'package:sasta_app/utils/routs.dart';
import 'package:sasta_app/widgets/home_widgets/catalog_header.dart';
import 'package:sasta_app/widgets/home_widgets/catalog_list.dart';
import 'package:sasta_app/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/6103d868c875da060872d31b";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;
    final decodedJson = jsonDecode(catalogJson);
    final productData = decodedJson['products'];
    CatalogueModels.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, store, _) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRouts.cartRoute),
          child: Icon(
            CupertinoIcons.cart,
            color: MyTheme.creamColor,
          ),
          backgroundColor: context.theme.buttonColor,
        ).badge(
          color: Vx.red500,
          size: 20,
          count: _cart!.item.length,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              CatalogueModels.items.isNotEmpty
                  ? CatalogList().py16().expand()
                  : CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
