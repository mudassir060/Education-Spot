import 'package:flutter/material.dart';

Widget staper(num) {
  return Row(
    children: [
    num>=1?  Icon(Icons.star, color: Colors.yellow,):Icon(Icons.star, color: Colors.grey,),
    num>=2?  Icon(Icons.star, color: Colors.yellow,):Icon(Icons.star, color: Colors.grey,),
    num>=3?  Icon(Icons.star, color: Colors.yellow,):Icon(Icons.star, color: Colors.grey,),
    num>=4?  Icon(Icons.star, color: Colors.yellow,):Icon(Icons.star, color: Colors.grey,),
    num>=5?  Icon(Icons.star, color: Colors.yellow,):Icon(Icons.star, color: Colors.grey,),
    num>=6?  Icon(Icons.star, color: Colors.yellow,):Icon(Icons.star, color: Colors.grey,),
    ],
  );
}
