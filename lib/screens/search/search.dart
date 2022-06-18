

import 'package:flutter/material.dart';
import 'package:pk_shop/models/product.dart';
import 'package:pk_shop/themes.dart';
import 'package:provider/provider.dart';

import '../../provider/sanpham_provider.dart';

class Search extends StatefulWidget {
  List<SanPham>? listSp;
  Search({Key? key, this.listSp}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController searchCtrl = TextEditingController();
  String? searchData;

  List<SanPham>? listSp;
  List<SanPham>? newListSp;
  @override
  void initState() {
    listSp = widget.listSp;
    if(listSp == null){
      SanPhamProvider sanPhamProvider = Provider.of(context, listen: false);
      listSp = sanPhamProvider.getListSanPham;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        backgroundColor: primaryColor,
        actions: const [
          Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.menu_rounded),)
        ],
      ),
      body: Column(
        children: [
          const ListTile(
            title: Text("Item"),
          ),
          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: searchCtrl,
              onChanged: (value)=> searchData = value,
              decoration: InputDecoration(
                  fillColor: Color(0xffc2c2c2),
                  filled: true,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none
                  ),
                  hintText: "Search items in the store",
                  suffixIcon: InkWell(
                    child: const Icon(Icons.search),
                    onTap: (){
                      setState(() {
                        newListSp = listSp?.where((element) => element.ten!.toUpperCase().contains(searchData == null?"" : searchData?.toUpperCase()??"")).toList();
                        searchData = "";
                      });
                    },
                  ),
              ),
            ),
          ),
          const SizedBox(height: 30,),
          searchData ==null ?
              SizedBox(height: 0.1,)
          : Row(
            children: [
              const SizedBox(width: 20,),
              Text(newListSp == null || newListSp?.length ==0 ? "0" : newListSp!.length.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(width: 3,),
              const Text("Kết quả tìm được!",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          Expanded(
                child: (newListSp ==null || newListSp?.length ==0)?
                    const SizedBox(height: 0.1,)
                    :Container(
                  height: double.infinity,
                  child: ListView.builder(
                    itemCount: newListSp?.length,
                    itemBuilder: (context, index){
                      var sanPham = newListSp![index];
                      return Column(
                        children: [
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                    child: Image.network(sanPham.anh!),
                                  )
                              ),
                              Expanded(
                                  child: Container(
                                    height: 100,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(sanPham.ten!.length > 30 ? sanPham.ten!.substring(0,30) +"..." : sanPham.ten!,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            SizedBox(height: 5,),
                                            RichText(
                                                maxLines: 2,
                                                overflow: TextOverflow.clip,
                                                text: TextSpan(
                                                    text: sanPham.gia!.toString(),
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
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            ],
                          ),
                          const Divider(height: 10,thickness: 2,)
                        ],
                      );
                    },

                  ),
                )
          )
        ],
      ),
    );
  }
}

