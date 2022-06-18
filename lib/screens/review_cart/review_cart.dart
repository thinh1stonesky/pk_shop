

import 'package:firebase_auth/firebase_auth.dart' as u;
import 'package:flutter/material.dart';
import 'package:pk_shop/auth/sign_in.dart';
import 'package:pk_shop/helpers/function/function.dart';
import 'package:pk_shop/provider/review_cart_provider.dart';
import 'package:pk_shop/provider/user_provider.dart';

import 'package:pk_shop/themes.dart';
import 'package:pk_shop/widgets/single_item.dart';
import 'package:provider/provider.dart';

import '../../models/review_cart.dart';
import '../../models/user.dart';
import '../order/add_info_user_page.dart';
import '../order/delivery_address_page.dart';




class ReviewCartPage extends StatefulWidget {
  const ReviewCartPage({Key? key}) : super(key: key);

  @override
  State<ReviewCartPage> createState() => _ReviewCartPageState();
}

class _ReviewCartPageState extends State<ReviewCartPage> {
  ReviewCartProvider? cartProvider;
  UserProvider? userProvider;





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReviewCartProvider provider = Provider.of(context, listen: false);
    provider.fetchReviewCartData();

    UserProvider userProvider = Provider.of(context, listen: false);
    userProvider.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {

    cartProvider = Provider.of(context, listen: true);
    userProvider = Provider.of(context);

    List<User>? listUser = userProvider?.getListUser;
    List<ReviewCart>? listCart = cartProvider?.getListCart;
    num tongTien = tongTienGioHang(listCart);

    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Total"),
        subtitle: Text(tongTien.toString()),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: (){},
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: (){
                if(u.FirebaseAuth.instance.currentUser == null){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SignIn(),)
                  );
                }else{
                  User currentUser = getCurrentUser(u.FirebaseAuth.instance.currentUser!.uid, listUser!);
                  if(currentUser.userAddress ==null){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddInfoUserPage(currentUser: currentUser, listReviewCart: listCart!),)
                    );
                  }else{
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DeliveryAddressPage(listReviewCart: listCart!, currentUser: currentUser),)
                    );
                  }
                }
              },
              child: const Text("Submit", style: TextStyle(color: Colors.black87),),
            ),
          ),
        ),
      ),

      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Cart"),
      ),
      body: listCart!.isEmpty? const Center(child: Text("Chưa có sản phẩm trong giả hàng"))
          : ListView.builder(
        itemCount: listCart.length,
        itemBuilder: (context, index){
          var reviewCart = listCart[index];
          return Container(
            child: Column(
              children: [
                const SizedBox(height: 10,),
                SingleItem(
                  inCart: true,
                  reviewCart: reviewCart,
                ),
                const Divider(height: 10,thickness: 2,)
              ],
            ),
          );
        },

      ),
    );
  }
}

