

import 'package:flutter/material.dart';
import 'package:pk_shop/screens/order/add_info_user_page.dart';

import '../../models/review_cart.dart';
import '../../models/user.dart';
import '../../themes.dart';
import 'order_page.dart';

class DeliveryAddressPage extends StatelessWidget {
  User? currentUser;
  List<ReviewCart> listReviewCart;
  DeliveryAddressPage({Key? key, this.currentUser, required this.listReviewCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => AddInfoUserPage(listReviewCart: listReviewCart, addAddress: true, currentUser: currentUser,),)
          , (route) => false);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Delivery Details"),
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text("Gửi đến"),
            leading: Icon(Icons.location_on_outlined),
          ),
          const Divider(height: 1,),
          Column(
            children: currentUser!.userAddress!.asMap().entries.map((e){
              return Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => OrderPage(listReviewCart: listReviewCart, currentUser: currentUser!, addressIndex: e.key),)
                      );
                      },
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Center(child: Text(e.value.toString()),),
                    ),
                  ),
                  const Divider(
                    height: 2,
                  )
                ],
              );
            }

            ).toList(),
          ),
        ],
      ),
    );
  }
}

