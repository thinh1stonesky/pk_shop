

import 'package:pk_shop/models/product.dart';
import 'package:pk_shop/models/review_cart.dart';


class YourOrder{
  String? diachi, orderid;
  num? tongtien;
  num? soluong;
  YourOrder({
    this.diachi,
    this.tongtien,
    this.soluong,
  });

  Map<String, dynamic> toJson(){
    return {
      'diachi' : diachi,
      'tongtien' : tongtien,
      'soluong' : soluong,
    };
  }
}