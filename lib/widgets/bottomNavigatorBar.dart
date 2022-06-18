

import 'package:flutter/material.dart';

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