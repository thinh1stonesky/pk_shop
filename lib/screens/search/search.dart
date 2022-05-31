

import 'package:flutter/material.dart';
import 'package:pk_shop/widgets/single_item.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        actions: const [
          Padding(padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(Icons.menu_rounded),)
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Item"),
          ),
          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: const TextField(
              decoration: InputDecoration(
                  fillColor: Color(0xffc2c2c2),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none
                  ),
                hintText: "Search items in the store",
                suffixIcon: Icon(Icons.search)
              ),
            ),
          ),
          const SizedBox(height: 30,),
          SingleItem(),
        ],
      ),
    );
  }
}
