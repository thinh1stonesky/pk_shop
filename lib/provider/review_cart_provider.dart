

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/foundation/change_notifier.dart';

import '../models/review_cart.dart';

class ReviewCartProvider extends ChangeNotifier{

  List<ReviewCart> _listCart = [];

  ReviewCart? reviewCart;


  List<ReviewCart> get getListCart{
    return _listCart;
  }



  void addReviewCart({
    String? ten, anh,
    int? id,
    dynamic gia,
    dynamic soluong
  })async{
    FirebaseFirestore.instance.collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc("$id")
        .set({
      'ten': ten,
      'anh' : anh,
      'id' : id,
      'gia' : gia,
      'soluong' : soluong
    });
  }

  void fetchReviewCartData() async{
    List<ReviewCart> newListCart = [];
    QuerySnapshot value = await FirebaseFirestore.instance.collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .get();

      value.docs.forEach((element) { 
        reviewCart = ReviewCart(
            ten: element.get("ten"),
            soluong: element.get("soluong"),
          anh: element.get("anh"),
          gia: element.get("gia"),
          id: element.get("id")
        );
        newListCart.add(reviewCart!);
      });
      _listCart = newListCart;
      notifyListeners();
  }


  deleteViewCart(int id){
    FirebaseFirestore.instance.collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc("$id")
        .delete();
    notifyListeners();
  }

  deleteAllViewCart(String id){
    FirebaseFirestore.instance.collection("ReviewCart")
        .doc(id)
        .collection("YourReviewCart")
        .get().then((snapshot) {
          for (DocumentSnapshot ds in snapshot.docs){
            ds.reference.delete();
          }
        });
    notifyListeners();
  }


  updataReviewCart(ReviewCart reviewCart ){
    FirebaseFirestore.instance.collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc("${reviewCart.id}")
        .update(reviewCart.toJson());
  }



}