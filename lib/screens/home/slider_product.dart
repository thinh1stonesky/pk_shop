
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pk_shop/screens/home/temp_data.dart';

class SliderProduct extends StatelessWidget {
  LoaiPK loaiPK;
  SliderProduct({Key? key, required this.loaiPK}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(loaiPK.content),
                    InkWell(
                      onTap: (){},
                      child: const Text("View all",
                          style: TextStyle(
                              color: Colors.grey
                        ),
                      )
                  )
                ]
                )
      ),
        // Expanded(
        //     child: ListView(
        //       children: [
        //       ],
        //     ),
        // ),
    ]
    );


    //   ListView(
    //   children: [
    //     Padding(
    //       padding: EdgeInsets.symmetric(vertical: 5),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //             Text(loaiPK.content),
    //             InkWell(
    //               onTap: (){},
    //               child: const Text("View all",
    //                   style: TextStyle(
    //                       color: Colors.grey
    //                 ),
    //               )
    //           )
    //         ],
    //      ),
    // ),
    // ListView.builder(
    // // scrollDirection: Axis.horizontal,
    // itemCount: sanphams.length,
    //   itemBuilder: (context, index) {
    //     SanPham sp = sanphams[index];
    //     return Container(
    //         margin: const EdgeInsets.symmetric(horizontal: 5),
    //         decoration: BoxDecoration(
    //             border: Border.all(width: 1, color: Colors.grey[500]!),
    //             color: Colors.white,
    //             borderRadius: BorderRadius.circular(20)
    //         ),
    //         width: 300,
    //         height: 300,
    //         child: Column(
    //           children: [
    //             Expanded(
    //                 flex: 2,
    //                 child: Padding(
    //                   padding: const EdgeInsets.symmetric(vertical: 10),
    //                   child: Image.network(sp.urlName,
    //                   ),)
    //             ),
    //             Expanded(
    //                 child: Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 5),
    //                   child: Column(
    //                     children: [
    //                       Text(sp.name,
    //                         style: TextStyle(fontSize: 12),
    //                       ),
    //                       const Text("2.790.000 đ",
    //                         style: TextStyle(fontSize: 12, color: Colors.red),
    //                       ),
    //                     ],
    //                   ),
    //                 )
    //             ),
    //           ],
    //         ));
    //   },
    //
    // )
    //
    // ],
    // );

  }
}
