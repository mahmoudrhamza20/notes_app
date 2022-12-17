import 'package:flutter/material.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit.dart';
import '../../models/note_model.dart';
import 'edit_note_view_body.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  EditNoteViewBody(note: note,),
            ));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 14),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:  Text(
                note.title,
                style:const TextStyle(fontSize: 24, color: Colors.black),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(.4),
                  ),
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 26,
                ),
                onPressed: () {
                  note.delete();
                  NoteCubit.get(context).fetchAllNotes();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 24,
                top: 16,
              ),
              child: Text(
                note.date,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(.4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
