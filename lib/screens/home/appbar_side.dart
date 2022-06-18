

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:pk_shop/provider/review_cart_provider.dart';
import 'package:provider/provider.dart';

import '../../themes.dart';
import '../review_cart/review_cart.dart';
import '../search/search.dart';

class AppbarSide extends StatefulWidget {
  String? title;

  AppbarSide({Key? key, this.title}) : super(key: key);
  @override
  State<AppbarSide> createState() => _AppbarSideState();
}

class _AppbarSideState extends State<AppbarSide> {
  String? title;
  ReviewCartProvider? provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.title;
    ReviewCartProvider? provider = Provider.of<ReviewCartProvider>(context, listen: false);
    provider.fetchReviewCartData();

  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ReviewCartProvider>(context, listen: true);

    int count = provider!.getListCart.length;
    return AppBar(
      backgroundColor: primaryColor,
      title: Text(title!, style: const TextStyle(fontSize: 17),),
      actions: [
        InkWell(
          onTap: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Search(),)
            );
          },
          child: const CircleAvatar(
            backgroundColor: Colors.white70,
            radius: 12,
            child: Icon(Icons.search, size: 17, color: Colors.black87,),
          ),
        ),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ReviewCartPage(),)
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.white70,
                radius: 12,
                child: Badge(
                  showBadge: count>0,
                  badgeContent: Text(count.toString()),
                  child: const Icon(Icons.shop, size: 17, color: Colors.black87,),
                ),
              ),
            )
        ),
      ],
    );
  }
}

