

import 'package:flutter/material.dart';
import 'package:pk_shop/models/review_cart.dart';
import 'package:pk_shop/provider/review_cart_provider.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  ReviewCart reviewCart;
  Count({Key? key, required this.reviewCart}) : super(key: key);

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  late ReviewCartProvider provider;
  late ReviewCart reviewCart;
  late int count;
  @override
  void initState() {
    // TODO: implement initState
    reviewCart = widget.reviewCart;
    count = reviewCart.soluong ?? 1;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    provider = Provider.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      height: 35,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 1,
              color: Colors.grey
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            onTap: (){
              setState(() {
                if(count <= 1){
                  count = 1;
                }else{
                  count--;
                  reviewCart.soluong = count;
                  provider.updataReviewCart(reviewCart);
                }
              });
            },
            child: Icon(
              Icons.arrow_left,
              color: count == 1? Colors.grey: Colors.black87,
            ),
          ),
          Text("$count",
            style: const TextStyle(
              color: Colors.grey
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            onTap: (){
              setState(() {
                if(count >= 99){
                  count = 99;
                }
                count++;
                reviewCart.soluong = count;
                provider.updataReviewCart(reviewCart);
              });
            },
            child: Icon(
              Icons.arrow_right,
              color: count == 99 ? Colors.grey: Colors.black87,
            ),
          )
        ],
      ),
    );
  }
}
