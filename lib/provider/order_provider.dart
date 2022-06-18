


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:pk_shop/models/products_order.dart';
import 'package:pk_shop/models/your_order.dart';

import '../models/review_cart.dart';

class OrderProvider extends ChangeNotifier{

  late YourOrder _yourOrder;
  List<ProductsOrder> _listProductOder = [];

  ReviewCart? reviewCart;


  List<ProductsOrder> get getListProductOrder{
    return _listProductOder;
  }

  YourOrder get getYourOrder{
    return _yourOrder;
  }

  String getOrderId(){
    return '${DateTime.now().day}'
        '${DateTime.now().month}'
        '${DateTime.now().year}'
        '${DateTime.now().hour}'
        '${DateTime.now().minute}'
        '${DateTime.now().second}';
  }


  void addProductOrder({
    String? ten, anh, orderid,
    int? id,
    dynamic gia,
    dynamic soluong
  })async{
    FirebaseFirestore.instance.collection("Order")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("ProductsOrder")
        .doc("$orderid")
        .collection("ListProduct")
        .doc("$id")
        .set({
      'ten': ten,
      'anh' : anh,
      'id' : id,
      'gia' : gia,
      'soluong' : soluong
    });
  }
  void addOrder({
    String? diachi, orderid,
    dynamic tongtien,
    dynamic soluong
  })async{
    FirebaseFirestore.instance.collection("Order")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourOrder")
        .doc("$orderid")
        .set({
      'diachi': diachi,
      'orderid' : orderid,
      'tongtien' : tongtien,
      'soluong' : soluong
    });
  }

  // void fetchReviewCartData() async{
  //   List<ReviewCart> newListCart = [];
  //   QuerySnapshot value = await FirebaseFirestore.instance.collection("ReviewCart")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .collection("YourReviewCart")
  //       .get();
  //
  //   value.docs.forEach((element) {
  //     reviewCart = ReviewCart(
  //         ten: element.get("ten"),
  //         soluong: element.get("soluong"),
  //         anh: element.get("anh"),
  //         gia: element.get("gia"),
  //         id: element.get("id")
  //     );
  //     newListCart.add(reviewCart!);
  //   });
  //   _listCart = newListCart;
  //   notifyListeners();
  // }
  //
  //
  // deleteViewCart(int id){
  //   FirebaseFirestore.instance.collection("ReviewCart")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .collection("YourReviewCart")
  //       .doc("$id")
  //       .delete();
  //   notifyListeners();
  // }
  //
  // deleteAllViewCart(String id){
  //   FirebaseFirestore.instance.collection("ReviewCart")
  //       .doc(id)
  //       .delete();
  //   notifyListeners();
  // }
  //
  //
  // updataReviewCart(ReviewCart reviewCart ){
  //   FirebaseFirestore.instance.collection("ReviewCart")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .collection("YourReviewCart")
  //       .doc("${reviewCart.id}")
  //       .update(reviewCart.toJson());
  // }



}