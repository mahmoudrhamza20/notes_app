import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: const [
            SizedBox(height: 30,),
            CustomAppBar(tittle: 'Edit Notes',icon: Icons.done),
          ],
        ),
      )
    );
  }
}
