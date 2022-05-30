

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pk_shop/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: secondaryColor,
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Home", style: TextStyle(fontSize: 17),),
        actions: const [
          CircleAvatar(
            backgroundColor: Colors.white70,
            radius: 12,
            child: Icon(Icons.search, size: 17, color: Colors.black87,),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 5),
          child: CircleAvatar(
            backgroundColor: Colors.white70,
            radius: 12,
            child: Icon(Icons.shop, size: 17, color: Colors.black87,),
          ),)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            Container(
              width: _screenSize.width,
              height: _screenSize.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10)
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(urlImage +"banner_homescreen.jpg")
                )
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: _screenSize.height *0.05,
                              width: _screenSize.width * 0.15,
                              decoration: const BoxDecoration(
                                  color: primaryColor,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(45),
                                  bottomLeft: Radius.circular(45),
                                ),
                              ),
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
                              )
                            ),
                            const Padding(padding: EdgeInsets.only(
                              left: 20, top: 25
                            ),
                            child: Text("20% Off",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),),
                            const Padding(padding: EdgeInsets.only(
                                left: 15, top: 5
                            ),
                              child: Text("Cho toàn bộ sản phẩm",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                ),
                              ),),
                          ],
                        ),
                      )
                  ),
                  Expanded(
                      child: Column(
                        children: [],
                      )
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tai nghe"),
                  Text("View all",
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: _screenSize.height*0.3,
              width: _screenSize.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SliderProduct(_screenSize),
                    SliderProduct(_screenSize),
                    SliderProduct(_screenSize),
                    SliderProduct(_screenSize),
                    SliderProduct(_screenSize),
                  ],
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tai nghe"),
                  Text("View all",
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  )
                ],
              ),
            ),
            Container(
                height: _screenSize.height*0.3,
                width: _screenSize.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SliderProduct(_screenSize),
                      SliderProduct(_screenSize),
                      SliderProduct(_screenSize),
                      SliderProduct(_screenSize),
                      SliderProduct(_screenSize),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  Widget SliderProduct(Size screenSize) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey[500]!),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        width: screenSize.width*0.4,
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Image.network("https://image.cellphones.com.vn/358x/media/catalog/product/a/z/azaudio-tai-nghe-bluetooth-apple-airpod-2_2.jpg",
                  ),)
            ),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: const [
                      Text("Tai nghe Bluetooth Apple AirPods 2 VN/A",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text("2.790.000 đ",
                        style: TextStyle(fontSize: 12, color: Colors.red),
                      ),
                    ],
                  ),
                )
            ),
          ],
        ));
  }
}
