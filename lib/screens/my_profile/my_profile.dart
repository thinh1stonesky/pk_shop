
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pk_shop/screens/home/drawer_side.dart';
import 'package:pk_shop/themes.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: DrawerSide(screenSize: size,),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("My Profile"),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: primaryColor,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: secondaryColor,
                ),
                    child: ListView(
                      children: [
                        const SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Ngọc Thịnh",
                                  style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text("phanthinh106@gmai.com",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: primaryColor,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: secondaryColor,
                                  child: Icon(
                                    Icons.edit,
                                    size: 28,
                                    color: primaryColor,
                                  ),
                                ),
                              ),)
                          ],
                        ),
                        const SizedBox(height: 25,),
                        listTile(icon: Icons.shop_outlined, title: "My Orders"),
                        listTile(icon: Icons.location_on_outlined, title: "My Delivery Adress"),
                        listTile(icon: Icons.person_outline, title: "Refer A Friend"),
                        listTile(icon: Icons.file_copy_outlined, title: "Terms & Conditions"),
                        listTile(icon: Icons.policy_outlined, title: "Privacy Policy"),
                        listTile(icon: Icons.add_chart, title: "About"),
                        listTile(icon: Icons.exit_to_app, title: "Log Out"),
                      ],
                    ),
              ))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 45, left: 40),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                radius: 45,
                backgroundColor: secondaryColor,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text: "PK\n",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
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
          )
        ],
      ),
    );

  }
  Widget listTile({required IconData icon, required String title}){
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }
}
