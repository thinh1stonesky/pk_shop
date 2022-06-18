

import 'package:flutter/material.dart';

richText(num tien) {
  return RichText(
      maxLines: 2,
      overflow: TextOverflow.clip,
      text: TextSpan(
          text: tien.toString(),
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
  );
}