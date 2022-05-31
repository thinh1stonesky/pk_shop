


import 'package:flutter/material.dart';
import 'package:pk_shop/themes.dart';

class SingleItem extends StatelessWidget {
  bool? inCart = false;
  SingleItem({Key? key, this.inCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
              child: Image.network("https://image.cellphones.com.vn/358x/media/catalog/product/a/z/azaudio-tai-nghe-bluetooth-apple-airpod-2_2.jpg"),
            )
        ),
        Expanded(
            child: Container(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: inCart ==false? MainAxisAlignment.spaceAround : MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("ProductName",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 5,),
                      Text("\$50",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  inCart ==false ?Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 1,
                            color: Colors.grey
                        )
                    ),
                    child: Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text("\$50", style: TextStyle(color: Colors.grey),),
                          Icon(Icons.arrow_drop_down, color: primaryColor,)
                        ],
                      ),
                    ),
                  )
                      : const Text("\$50")

                ],
              ),
            )
        ),
        Expanded(
            child: inCart == false ?Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 1,
                          color: Colors.grey
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(Icons.shopping_cart, color: primaryColor,),
                      Text("ADD", style: TextStyle(color: primaryColor),),

                    ],
                  ),
                )
                : Column(
              children: [
                Icon(Icons.delete),
                SizedBox(height: 5,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 1,
                          color: Colors.grey
                      )
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.remove),
                      Text("1"),
                      Icon(Icons.add)
                    ],
                  ),
                )
              ],
            )

        ),
      ],
    );
  }
}
