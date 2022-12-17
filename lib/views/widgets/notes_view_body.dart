
import 'package:flutter/material.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit.dart';

import 'custom_app_bar.dart';
import 'custom_item_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    NoteCubit.get(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: const [
          SizedBox(height: 30,),
          CustomAppBar(tittle: 'Notes',icon: Icons.search,),
          Expanded(child: CustomNotesListView()),
        ],
      ),
    );
  }
}






