
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pk_shop/auth/sign_in.dart';
import 'package:pk_shop/models/product.dart';
import 'package:pk_shop/provider/review_cart_provider.dart';
import 'package:pk_shop/screens/review_cart/review_cart.dart';
import 'package:provider/provider.dart';

import '../../themes.dart';
import '../../widgets/bottomNavigatorBar.dart';
import '../home/appbar_side.dart';

enum SinginCharacter{ fill, outline}

class ProductOverview extends StatefulWidget {
  SanPham sp;
  ProductOverview({required this.sp});
  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {

  late SanPham sp;
  SinginCharacter _character = SinginCharacter.fill;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sp = widget.sp;
  }
  @override
  Widget build(BuildContext context) {
    ReviewCartProvider provider = Provider.of(context);
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigatorBar(
              iconColor: Colors.white,
              bgColor: Colors.black54,
              color: Colors.white,
              title: "Add to WishList",
              iconData: Icons.favorite_outline
          ),
          InkWell(
            onTap: ()=>Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ReviewCartPage(),)
            ),
            child: bottomNavigatorBar(
              iconColor: Colors.black54,
              bgColor: Colors.yellow,
              color: Colors.black54,
              title: "Go to cart",
              iconData: Icons.shop_outlined,
            ),
          )
        ],
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppbarSide(title: "Product Overview"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(sp.ten!),
                    ),
                    Container(
                      height: 250,
                      padding: EdgeInsets.all(30),
                      child: Image.network(sp.anh!, fit: BoxFit.cover,),
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.green,
                              ),
                              Radio<SinginCharacter>(
                                  value: SinginCharacter.fill,
                                  groupValue: _character,
                                  activeColor: Colors.green,
                                  onChanged: (value){
                                    setState(() {
                                      _character = value!;
                                    });
                                  }),
                              RichText(
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  text: TextSpan(
                                      text: sp.gia.toString(),
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
                          InkWell(
                            splashColor: Colors.transparent,
                            onTap: (){
                              if(FirebaseAuth.instance.currentUser == null){
                                Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => const SignIn(),), (route) => false);
                              }else{
                                provider.addReviewCart(
                                  id: sp.id,
                                  gia: sp.gia,
                                  anh: sp.anh,
                                  ten: sp.ten,
                                  soluong: 1,
                                );
                                provider.fetchReviewCartData();
                                Fluttertoast.showToast(
                                    msg: "Đã thêm ${sp.ten} vào giỏ hàng",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: primaryColor,
                                    textColor: Colors.black87,
                                    fontSize: 16.0
                                );
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.add,
                                    size: 17,
                                    color: primaryColor,
                                  ),
                                  Text("Add",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 14
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Thông tin sản phẩm",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(sp.chitiet!)
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
