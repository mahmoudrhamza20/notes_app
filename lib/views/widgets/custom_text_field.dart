import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hint, this.maxLines = 1,this.onSave, this.onChanged}) : super(key: key);

  final String hint;
  final int maxLines;
  final void Function(String?)? onSave ;
  final Function(String)? onChanged ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSave,
      onChanged:onChanged ,
      maxLines: maxLines,
      validator: (value){
        if(value?.isEmpty ?? true){
          return '$hint is required';
        }else {return null ;}
      },
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
          hintText: hint,
          border: buildOutlineBorder(),
          enabledBorder: buildOutlineBorder(),
          focusedBorder: buildOutlineBorder(kPrimaryColor)),
    );
  }

  OutlineInputBorder buildOutlineBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
