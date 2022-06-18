


import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pk_shop/models/catogery.dart';
import 'package:pk_shop/models/product.dart';
import 'package:pk_shop/themes.dart';

class ProductsRandom extends StatefulWidget {
  List<SanPham> listSp;
  List<Category> listCategory;
  ProductsRandom({Key? key, required this.listSp, required this.listCategory}) : super(key: key);

  @override
  State<ProductsRandom> createState() => _ProductsRandomState();
}

class _ProductsRandomState extends State<ProductsRandom> {
  late List<SanPham> listSp;
  late List<Category> listCategory;
  int _index = 0;
  late PageController _pageCtr;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    listSp = widget.listSp;
    listCategory = widget.listCategory;
    _pageCtr = PageController(viewportFraction: 0.9 );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: secondaryColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Products Today"),
        backgroundColor: primaryColor,
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: size.height*0.1,),
            SizedBox(
                height: size.height * 2/3,
                child: PageView.builder(
                        controller: _pageCtr,
                        onPageChanged: (index){
                          setState(() {
                            _index = index;
                          });
                        },
                        itemCount: listSp.length,
                        itemBuilder: (context, index){
                          SanPham sp = listSp[index];
                          return Stack(
                            children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 7),
                                  child: Material(
                                    color: Colors.white,
                                    elevation: 6,
                                    borderRadius: BorderRadius.circular(20),
                                    child: InkWell(
                                      onDoubleTap: (){
                                      },
                                      splashColor: Colors.transparent,
                                      child: Container(
                                        padding: EdgeInsets.all(10),

                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  child: FadeInImage(
                                                    placeholder: AssetImage(urlImage+"loading_1.gif"),
                                                    image: NetworkImage(sp.anh!,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  height: size.height*0.3,
                                                  color: Colors.blue
                                              ),

                                              RichText(
                                                  maxLines: 2,
                                                  overflow: TextOverflow.clip,
                                                  text: TextSpan(
                                                      text: sp.ten,
                                                      style: const TextStyle(
                                                          fontSize: 30,
                                                          color: Colors.black54,
                                                          shadows: [
                                                            BoxShadow(
                                                                color: Colors.black38,
                                                                offset: Offset(1,1),
                                                                blurRadius: 6
                                                            )
                                                          ]
                                                      ),
                                                      children: [
                                                      ]
                                                  )
                                              ),
                                              Container(
                                                width: double.infinity,
                                                padding: EdgeInsets.only(top: 5),
                                                child: AutoSizeText("Loại sản phẩm: " + listCategory.where((element) => element.id == sp.categoryId).first.content,
                                                  style: const TextStyle(
                                                    color: Colors.blue,
                                                  ),
                                                  textAlign: TextAlign.end,
                                                  maxLines: 1,
                                                  minFontSize: 2,
                                                  maxFontSize: 24,
                                                ),

                                              ),
                                              Container(
                                                height: size.height *0.2,
                                                margin: EdgeInsets.only(top: 10),
                                                child: AutoSizeText(sp.chitiet!,
                                                  maxLines: 6,
                                                  minFontSize: 10,
                                                  maxFontSize: 24,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),

                                      ),
                                    ),
                                  )
                              ),
                              Positioned(
                                  right: 0,
                                  top: 15,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    height: size.height*0.04,
                                    width: size.width*0.3,
                                    child: RichText(
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                        text: TextSpan(
                                            text: listSp[_index].gia.toString(),
                                            style: const TextStyle(
                                                fontSize: 17,
                                                color: Colors.black54,
                                                shadows: [
                                                  BoxShadow(
                                                      color: Colors.white,
                                                      offset: Offset(1,1),
                                                      blurRadius: 3
                                                  )
                                                ]
                                            ),
                                            children: const [
                                              TextSpan(
                                                  text: "VNĐ",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10
                                                  )
                                              )
                                            ]
                                        )
                                    ),
                                  ))
                            ],
                          );
                        }),


            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: SizedBox(
                    height: size.height * 1/11,
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        alignment: Alignment.center,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index){
                              return buildIndicator(index == _index, size);
                            }
                        )
                    )
                )
            )

          ],
        ),
      ),
    );
  }
  Widget buildIndicator(bool isActive, Size size) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
      margin: const EdgeInsets.symmetric(horizontal:12),
      height: 8,
      width: isActive ? size.width * 1/5 : 24,
      decoration: BoxDecoration(
          color: isActive? Colors.lightBlue : Colors.black54,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          boxShadow: const [
            BoxShadow(
                color: Colors.black38,
                offset: Offset(2, 3),
                blurRadius: 3
            )
          ]
      ),
    );
  }
}
