import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key,  this.onTap ,required this.text}) ;
   void Function()? onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 40,
        child: Center(
          child: Text(text,style:const TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}
