

import 'package:flutter/material.dart';
import 'package:pk_shop/models/product.dart';
import 'package:pk_shop/screens/product_overview/product_overview.dart';

class ProductItem extends StatelessWidget {
  SanPham sp;
  ProductItem({Key? key, required this.sp}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey[500]!),
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.network(sp.anh!,
                    ),)
              ),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        Text(sp.ten!.length > 30 ? sp.ten!.substring(0,30) +"..." : sp.ten!,
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                        Text(sp.gia.toString(),
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        ),
                      ],
                    ),
                  )
              ),
            ],
          )),
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProductOverview(sp: sp,))
        );
      },
    );
  }
}

