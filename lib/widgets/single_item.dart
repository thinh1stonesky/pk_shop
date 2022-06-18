


import 'package:flutter/material.dart';
import 'package:pk_shop/models/review_cart.dart';
import 'package:pk_shop/provider/review_cart_provider.dart';
import 'package:pk_shop/themes.dart';
import 'package:provider/provider.dart';

import '../helpers/dialog.dart';

class SingleItem extends StatefulWidget {

  bool? inCart;
  ReviewCart? reviewCart;

  SingleItem({Key? key,
    this.inCart,
    this.reviewCart,
  }) : super(key: key);

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  ReviewCartProvider? provider;
  bool? inCart = false;
  ReviewCart? reviewCart;
  String? anh, ten;
  int? gia;
  late int count;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inCart = widget.inCart;
    reviewCart = widget.reviewCart;
    count = reviewCart?.soluong;
  }


  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Row(
      children: [
        Expanded(
            child: Container(
              child: Image.network(reviewCart!.anh!),
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
                    children: [
                      Text(reviewCart!.ten!.length > 30 ? reviewCart!.ten!.substring(0,30) +"..." : reviewCart!.ten!,
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 5,),
                      RichText(
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          text: TextSpan(
                              text: reviewCart!.gia!.toString(),
                              style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.black54,
                                  shadows: [
                                    BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(1,1),
                                        blurRadius: 3
                                    )
                                  ]
                              ),
                              children: const [
                                TextSpan(
                                    text: "VNĐ",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10
                                    )
                                )
                              ]
                          )
                      ),
                    ],
                  ),
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
                InkWell(
                    child: Icon(Icons.delete),
                    onTap: () {
                      setState(() {
                        _xoa(context, reviewCart!.ten!);
                        provider?.fetchReviewCartData();
                      });

                    }
                ),
                SizedBox(height: 5,),
                Container(
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
                              reviewCart?.soluong = count;
                              provider?.updataReviewCart(reviewCart!);
                              provider?.fetchReviewCartData();
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
                            reviewCart?.soluong = count;
                            provider?.updataReviewCart(reviewCart!);
                            provider?.fetchReviewCartData();
                          });
                        },
                        child: Icon(
                          Icons.arrow_right,
                          color: count == 99 ? Colors.grey: Colors.black87,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )

        ),
      ],
    );
  }


  void _xoa(BuildContext context, String ten ) async {
    String? confirm;
    confirm = await showConfirmDialog(context, "Bạn muốn xóa $ten");
    if(confirm == "ok"){
      await provider!.deleteViewCart(reviewCart!.id!).whenComplete((){
        provider?.fetchReviewCartData();
        showSnackBar(context, "Xóa thành công", 3);
      })
          .onError((error, stackTrace) {
        showSnackBar(context, "Xóa không thành công", 3);
        return Future.error("Xóa dữ liệu không thành công");
      });

    }
  }
}

