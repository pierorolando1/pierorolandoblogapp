import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoBorderField extends StatelessWidget {
  const NoBorderField({
    Key? key,
    required this.placeholderText,
    required this.fontSize,
    required this.padding,
    required this.fontWeight,
    required this.placeholderColor
  }) : super(key: key);
  
  final String placeholderText;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final FontWeight fontWeight;
  final Color placeholderColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: placeholderText,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      placeholderStyle: TextStyle(fontWeight: fontWeight, color: placeholderColor),
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}