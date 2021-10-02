import 'package:flutter/material.dart';
import 'package:pierorolandoblog/colors.dart';

class GradientButton extends StatelessWidget {
  
  const GradientButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.from = const Color.fromRGBO(37, 99, 235, 1),
    this.to = const Color.fromRGBO(67, 56, 202, 1)
  }) : super(key: key);
  

  final onTap;
  final String text;
  final Color from;
  final Color to;

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: LinearGradient(colors: [blue_600, indigo_700]),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                text,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
