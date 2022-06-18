

import 'package:flutter/material.dart';
import 'package:pk_shop/provider/sanpham_provider.dart';
import 'package:pk_shop/screens/home/appbar_side.dart';
import 'package:pk_shop/screens/home/drawer_side.dart';
import 'package:pk_shop/screens/products_page/products_random.dart';
import 'package:pk_shop/themes.dart';
import 'package:provider/provider.dart';
import '../../widgets/build_slider_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SanPhamProvider? sanPhamProvider;
  @override
  void initState() {

    SanPhamProvider sanPhamProvider = Provider.of(context, listen: false);
    sanPhamProvider.fetchProductData();
    sanPhamProvider.fetchCategoryData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    sanPhamProvider = Provider.of(context);
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: secondaryColor,
      drawer: DrawerSide(screenSize: _screenSize),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppbarSide(title: "Home Screen"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child:
ListView(
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
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          child: Row(children: const [
            Text("Dạo"),
            Icon(Icons.directions_walk),
          ],),
          onTap: ()=>Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProductsRandom(listSp: sanPhamProvider!.getListSanPham,listCategory: sanPhamProvider!.getListCategory),)
          ),
        )
      ],
    ),
    const Divider(height: 10,),
    SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
          children: sanPhamProvider!.getListCategory
              .map((e) => buidProduct(screenSize: _screenSize,category: e,context: context,listSp: sanPhamProvider!.getListSanPham)).toList()
      ),
    )
  ],
)


      ),
    );
  }


}
