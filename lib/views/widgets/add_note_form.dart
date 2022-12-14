
import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key,}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey <FormState> formKey = GlobalKey();
  AutovalidateMode? autoValidateMode = AutovalidateMode.disabled;
  String? title , subtitle ;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode:autoValidateMode ,
      child: Column(
        children:  [
          const SizedBox(height: 20,),
          CustomTextField(hint: 'Title',onSave: (value){title= value;},),
          const SizedBox(height: 16,),
          CustomTextField(hint: 'Content', maxLines: 5,onSave: (value){subtitle= value;},),
          const SizedBox(height: 16,),
          CustomButton(text: 'Add',
            onTap: (){
              if(formKey.currentState!.validate()){
                formKey.currentState!.save();
              }else{
                autoValidateMode= AutovalidateMode.always ;
                setState(() {

                });
              }
            },
          ),
          const SizedBox(height: 8,),
        ],
      ),
    );
  }
}