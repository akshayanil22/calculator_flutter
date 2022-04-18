import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;

  CustomButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(40)),
      child: TextButton(child: Text(text,style: TextStyle(fontSize: 26,color: Colors.white),),onPressed:(){},),
    );
  }
}
