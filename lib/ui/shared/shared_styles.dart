import 'package:flutter/material.dart';

// Box Decorations

BoxDecoration fieldDecortaion = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[200]);

BoxDecoration disabledFieldDecortaion = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[100]);


 BoxDecoration kdecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(32),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  );

 BoxDecoration mdecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 3,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  );

 BoxDecoration kBoxDecorationStyle = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(width: 0.3, color: Colors.black26),
    boxShadow: [
      BoxShadow(
        offset: Offset(0, 0),
        color: Colors.black,
        spreadRadius: -10,
        blurRadius: 14,
      )
    ],
  );


// Field Variables

const double fieldHeight = 55;
const double smallFieldHeight = 40;
const double inputFieldBottomMargin = 30;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = const EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets largeFieldPadding =
    const EdgeInsets.symmetric(horizontal: 15, vertical: 15);

// Text Variables
const TextStyle buttonTitleTextStyle =
    const TextStyle(fontWeight: FontWeight.w700, color: Colors.white);