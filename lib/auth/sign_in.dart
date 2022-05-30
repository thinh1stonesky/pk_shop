
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pk_shop/screens/home_screen.dart';
import 'package:pk_shop/themes.dart';
import 'auth_methods.dart';



class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String thongBaoLoi = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(urlImage + "background.jpg"),
                fit: BoxFit.cover,
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Sign in to continue",
                      style: TextStyle(color: Colors.white,
                          shadows: [
                            BoxShadow(
                                blurRadius: 5,
                                color: Colors.black87,
                                offset: Offset(3,4)
                            )
                          ]),
                    ),
                    const Text("PK Shop",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          shadows: [
                            BoxShadow(
                                blurRadius: 5,
                                color: Colors.black87,
                                offset: Offset(8,6)
                            )
                          ]
                      ),),
                    Column(
                      children: [
                        SizedBox(
                          width: size.width * 0.7,
                          child: ElevatedButton(
                            onPressed: () async{
                              var user = await signWithGoogle();
                              if(user!=null){
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) => const HomeScreen(),)
                                    , (route) => false);
                              }else {
                                setState(() {
                                  thongBaoLoi = "Login fails";
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                primary: const Color(0xffffffff)
                            ),
                            child: Row(
                              children: const [
                                Icon(FontAwesomeIcons.google, color: Colors.redAccent,),
                                SizedBox(width: 10,),
                                Text('Sign in with Google', style: TextStyle(color: Colors.black87),),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.7,
                          child: ElevatedButton(
                            onPressed: (){
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                primary: const Color(0xff3b579e)
                            ),
                            child: Row(
                              children: const [
                                Icon(FontAwesomeIcons.facebook),
                                SizedBox(width: 10,),
                                Text('Sign in with Facebook'),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                            child: Text(thongBaoLoi),
                          visible: thongBaoLoi != "",
                        ),

                        Text("By signing in you are agreeing to our", style: TextStyle(color: Colors.grey[800]),),
                        Text("Term and Pricacy Policy", style: TextStyle(color: Colors.grey[800])),

                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
