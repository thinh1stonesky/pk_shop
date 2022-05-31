

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../themes.dart';

enum SinginCharacter{ fill, outline}

class ProductOverview extends StatefulWidget {
  String productName;
  String productImage;
  ProductOverview({required this.productName,required  this.productImage});
  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {

  late String productName;
  late String productImage;
  SinginCharacter _character = SinginCharacter.fill;

  Widget bottomNavigatorBar({
    required Color iconColor,
    required Color bgColor,
    required Color color,
    required String title,
    required IconData iconData
  }){
    return Expanded(
        child: Container(
          padding: EdgeInsets.all(20),
          color: bgColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 17,
                color: iconColor,
              ),
              const SizedBox(width: 5,),
              Text(
                title,
                style: TextStyle(color: color)
              )
            ],
          ),
        )
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productName = widget.productName;
    productImage = widget.productImage;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigatorBar(
              iconColor: Colors.white,
              bgColor: Colors.black54,
              color: Colors.white,
              title: "Add to WishList",
              iconData: Icons.favorite_outline
          ),
          bottomNavigatorBar(
              iconColor: Colors.black54,
              bgColor: Colors.yellow,
              color: Colors.black54,
              title: "Go to cart",
              iconData: Icons.shop_outlined
          ),
        ],
      ),
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
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(productName),
                      subtitle :Text("2.790.000 đ"),
                    ),
                    Container(
                      height: 250,
                      padding: EdgeInsets.all(30),
                      child: Image.network(productImage),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      child: Text("Có thể tùy chỉnh",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.green,
                              ),
                              Radio<SinginCharacter>(
                                  value: SinginCharacter.fill,
                                  groupValue: _character,
                                  activeColor: Colors.green,
                                  onChanged: (value){
                                    setState(() {
                                      _character = value!;
                                    });
                                  })
                            ],
                          ),
                          Text("\$50"),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.add,
                                  size: 17,
                                  color: primaryColor,
                                ),
                                Text("Add",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 14
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Thông tin sản phẩm",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Đầu tiên, AirPods 2 chính hãng VN/A là hàng chính hãng do Apple sản xuất theo tiêu chuẩn của thị trường Việt Nam. Thiết bị được phân phối chính hãng thông qua các đại lý ủy quyền của Apple. Vậy tai nghe bluetooth Apple AirPods 2 chính hãng VN/A có gì khác những mẫu tai nghe cũ, tai nghe xách tay?")
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
