import 'package:flutter/cupertino.dart';

Widget Card(String a, String b, double x, double y) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
        Text(
          a,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: x),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          b,
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: y),
        )
      ]),
    );
  }