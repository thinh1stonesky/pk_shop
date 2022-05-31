

import 'package:flutter/material.dart';
import 'package:pk_shop/themes.dart';
import 'package:pk_shop/widgets/single_item.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Total"),
        subtitle: Text("\$170.0"),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: (){},
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text("Submit", style: TextStyle(color: Colors.black87),),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView(
        children: [
          SingleItem(inCart: true,),
          SingleItem(inCart: true,),
          SingleItem(inCart: true,),
          SingleItem(inCart: true,)
        ],
      ),
    );
  }
}
