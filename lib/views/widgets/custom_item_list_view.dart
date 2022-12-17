import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit.dart';
import '../../models/note_model.dart';
import 'custom_note_item.dart';

class CustomNotesListView extends StatelessWidget {
  const CustomNotesListView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        List<NoteModel> notes= NoteCubit.get(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return  Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CustomNoteItem(note: notes[index],),
              );
            },
          ),
        );
      },
    );
  }
}
