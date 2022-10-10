
import 'dart:ui';

import 'package:flutter/material.dart';

class Glass_Effect extends StatelessWidget {
   Glass_Effect({
    Key? key,required this.column
 
  }) : super(key: key);
Widget ? column;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
    child: Container(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
          height:height*.7,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromARGB(153, 219, 249, 249), Colors.white10]),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: Color.fromARGB(77, 37, 34, 34),
              ),
            ),
         //   child:column,
          ),
        ),
      ),
    ),
    );
  }
}
