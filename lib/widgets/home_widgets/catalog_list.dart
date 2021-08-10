import 'package:flutter/material.dart';
import 'package:sasta_app/models/catalog.dart';
import 'package:sasta_app/widgets/home_widgets/home_detail_page.dart';

import 'catalog_item.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogueModels.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogueModels.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetail(catalog: catalog),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}
