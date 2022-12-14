
import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
          hintText: 'Tittle',
          border: buildOutlineBorder(),
          enabledBorder: buildOutlineBorder(),
          focusedBorder: buildOutlineBorder(kPrimaryColor)
      ),
    );
  }

  OutlineInputBorder buildOutlineBorder([ color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide:  BorderSide(color: color ?? Colors.white),
    );
  }
}