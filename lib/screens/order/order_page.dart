


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pk_shop/helpers/function/function.dart';
import 'package:pk_shop/provider/order_provider.dart';
import 'package:pk_shop/screens/home/home_screen.dart';
import 'package:pk_shop/widgets/txtVND.dart';
import 'package:provider/provider.dart';

import '../../models/review_cart.dart';
import '../../models/user.dart';
import '../../provider/review_cart_provider.dart';
import '../../themes.dart';

class OrderPage extends StatefulWidget {
  late List<ReviewCart> listReviewCart;
  User currentUser;
  int? addressIndex;
  OrderPage({Key? key, required this.listReviewCart, required this.currentUser, this.addressIndex}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  OrderProvider? orderProvider;
  ReviewCartProvider? reviewCartProvider;

  late List<ReviewCart> listReviewCart;
  late User currentUser;
  int? addressIndex;
  bool ordered =false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listReviewCart = widget.listReviewCart;
    currentUser = widget.currentUser;
    addressIndex =widget.addressIndex;
  }
  @override
  Widget build(BuildContext context) {
    orderProvider = Provider.of<OrderProvider>(context, listen: true);
    reviewCartProvider = Provider.of<ReviewCartProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đặt hàng"),
      ),
      bottomNavigationBar: ordered ?
      ListTile(
        title: const Text("Đặt hàng thành công"),
        trailing: SizedBox(
          width: 160,
          child: MaterialButton(
            onPressed: (){},
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: (){
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomeScreen(),),
                        (route) => false);
              },
              child: const Text("Tiếp tục đặt hàng", style: TextStyle(color: Colors.black87),),
            ),
          ),
        ),
      )
      :ListTile(
        title: const Text("Tổng thanh toán"),
        subtitle: richText(tongTienGioHang(listReviewCart) + 30000),
        trailing: SizedBox(
          width: 160,
          child: MaterialButton(
            onPressed: (){},
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: (){
                ordered =!ordered;
                String orderid = orderProvider!.getOrderId();
                orderProvider!.addOrder(
                  orderid: orderid,
                  soluong: tongSoLuongGioHang(listReviewCart),
                  diachi:addressIndex ==null? currentUser.userAddress![0] :currentUser.userAddress![addressIndex!],
                  tongtien: tongTienGioHang(listReviewCart) + 30000
                );

                for(ReviewCart e in listReviewCart){
                  orderProvider!.addProductOrder(
                      gia: e.gia,
                      id: e.id,
                      anh: e.anh,
                      soluong: e.soluong,
                      ten: e.ten,
                      orderid: orderid
                  );
                };

                reviewCartProvider?.deleteAllViewCart(currentUser.userId!);
                reviewCartProvider?.fetchReviewCartData();
                Fluttertoast.showToast(
                    msg: "Đặt hàng thành công",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: primaryColor,
                    textColor: Colors.black87,
                    fontSize: 16.0
                );

              },
              child: const Text("Đặt hàng", style: TextStyle(color: Colors.black87),),
            ),
          ),
        ),
      ),
      body: Padding(padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.location_on_outlined),
                          SizedBox(width: 5,),
                          Text("Địa chỉ nhận hàng")
                        ],
                      ),
                      Row(
                        children: [
                          Text(currentUser.userName!),
                          const SizedBox(width: 5,),
                          Text(currentUser.userPhone!)
                        ],
                      ),
                      addressIndex != null?
                      Text(currentUser.userAddress![addressIndex!])
                          :Text(currentUser.userAddress![0]),

                      const Divider(thickness: 1,),
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  child: ListView.builder(
                    itemCount: listReviewCart.length,
                    itemBuilder: (context, index){
                      ReviewCart reviewCart = listReviewCart[index];
                      return Container(
                        width: double.infinity,
                        height: 100,
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                  child: Image.network(reviewCart.anh!),
                                )
                            ),
                            Expanded(
                                child: Container(
                                  height: 1000,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(reviewCart.ten!.length > 30 ? reviewCart.ten!.substring(0,30) +"..." : reviewCart.ten!,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              RichText(
                                                  maxLines: 2,
                                                  overflow: TextOverflow.clip,
                                                  text: TextSpan(
                                                      text: reviewCart.gia!.toString(),
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
                                              Text("x" + reviewCart.soluong.toString()),
                                            ],
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tổng số tiền" + "(" +
                        tongSoLuongGioHang(listReviewCart).toString() + " sản phẩm)" ),
                    richText(tongTienGioHang(listReviewCart)),
                  ],
                ),
                const SizedBox(height: 10,),
                Container(
                  height: 150,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.currency_bitcoin),
                              Text("Phương thức thanh toán",
                                style: TextStyle(
                                    fontSize: 12
                                ),),
                            ],
                          ),
                          const Text("VietinBank [* 5108]",style: TextStyle(
                              fontSize: 12),
                          )
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Tổng tiền hàng",style: TextStyle(
                              fontSize: 12),),
                          richText(tongTienGioHang(listReviewCart)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Phí vận chuyển",style: TextStyle(
                              fontSize: 12),),
                          richText(30000)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Tổng thanh toán",style: TextStyle(
                              fontSize: 12),),
                          richText(tongTienGioHang(listReviewCart) + 30000)
                        ],
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),),
    );
  }
}

