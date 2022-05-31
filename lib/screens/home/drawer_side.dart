

import 'package:flutter/material.dart';
import 'package:pk_shop/screens/home/home_screen.dart';
import 'package:pk_shop/screens/my_profile/my_profile.dart';
import 'package:pk_shop/screens/review_cart/review_cart.dart';

import '../../themes.dart';

class DrawerSide extends StatelessWidget {
  late Size screenSize;
  DrawerSide({required this.screenSize});


  Widget listTile({required IconData icon, required String title,VoidCallback? onTap}){
    return ListTile(
      leading: Icon(icon, size: 32,),
      title: Text(title, style: TextStyle(color: Colors.black87),),
      onTap: onTap,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 43,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: primaryColor,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                            text: "PK\n",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                shadows: [
                                  BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 5,
                                      offset: Offset(2,2)
                                  )
                                ]
                            ),
                            children: <TextSpan>[
                              TextSpan(text: "Shop", style: TextStyle(
                                  fontSize: 12
                              ))
                            ]
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome Guest"),

                      OutlinedButton(
                          onPressed: (){},
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                      width: 2
                                  )
                              )
                          ),
                          child: Text("Sign up"))
                    ],
                  )
                ],
              )
          ),
          listTile(icon: Icons.home_outlined, title: "Home",
            onTap: ()=>Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen(),)
            )
          ),
          listTile(icon: Icons.shop_outlined, title: "Review Cart",
              onTap: ()=> Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ReviewCart(),)
    )
          ),
          listTile(icon: Icons.person_outline, title: "My Profile",
            onTap: ()=> Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const MyProfile(),)
            )),
          listTile(icon: Icons.notifications_outlined, title: "Notification"),
          listTile(icon: Icons.star_outline, title: "Rating & Review"),
          listTile(icon: Icons.favorite_outline, title: "Wishlist"),
          listTile(icon: Icons.copy_outlined, title: "Raise a Complaint"),
          listTile(icon: Icons.format_quote_outlined, title: "FAQs"),
          Container(
              margin: const EdgeInsets.only(left: 20),
              height: screenSize.height*0.3,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Contact Support", style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 10,),
                    Row(
                      children: const [
                        Text("Call us:", style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 5,),
                        Text("(+84) 349054106", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Row(
                      children: const [
                        Text("Mail us:", style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 5,),
                        Text("tphhn.61cntt@ntu.edu.vn", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ]
              )
          )],
      ),
    );
  }
}
