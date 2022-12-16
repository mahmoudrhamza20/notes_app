import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key, this.onTap, required this.text, this.isLoading = false});

  void Function()? onTap;
  String text;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 40,
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ))
              : Text(
                  text,
                  style: const TextStyle(color: Colors.black),
                ),
        ),
      ),
    );
  }
}
