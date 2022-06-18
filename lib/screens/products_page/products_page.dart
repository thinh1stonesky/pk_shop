

import 'package:flutter/material.dart';
import 'package:pk_shop/models/catogery.dart';
import 'package:pk_shop/models/product.dart';
import 'package:pk_shop/screens/products_page/product_item.dart';

class ProductsPage extends StatelessWidget {
  List<SanPham> listSp;
  Category category;
  ProductsPage({Key? key, required this.category, required this.listSp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.content),
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
          children: listSp.where((element) => element.categoryId == category.id).map((e) => ProductItem(sp: e)).toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10

          )
      ),
    );
  }
}
