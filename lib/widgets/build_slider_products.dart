import 'package:flutter/material.dart';

import '../models/catogery.dart';
import '../models/product.dart';
import '../screens/home/signal_product.dart';
import '../screens/product_overview/product_overview.dart';
import '../screens/products_page/products_page.dart';

Widget buidProduct({required BuildContext context,required List<SanPham> listSp, required Size screenSize, required Category category}){
  return listSp.where((e) => e.categoryId==category.id).length >=1?
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(category.content),
            InkWell(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProductsPage(category: category, listSp: listSp),)
                );
              },
              child: const Text("View all",
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
            )
          ],
        ),
      ),
      Container(
          height: screenSize.height*0.3,
          width: screenSize.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: listSp.where((e) => e.categoryId==category.id)
                    .map((e){
                  return SignalProduct(
                      sp: e,
                      screenSize: screenSize,
                      onTap: ()=> Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ProductOverview(sp: e),)
                      )
                  );
                }).toList()

            ),
          )
      ),
    ],
  )
      : const SizedBox(height: 0.1,);
}