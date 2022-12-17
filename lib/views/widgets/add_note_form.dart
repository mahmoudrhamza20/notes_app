import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode? autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hint: 'Title',
            onSave: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: 'Content',
            maxLines: 5,
            onSave: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                text: 'Add',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    DateTime currentDate = DateTime.now();
                    var formattedCurrentDate =
                        DateFormat.MMMMd().format(currentDate);
                    var note = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formattedCurrentDate,
                        color: Colors.blue.value);
                    AddNoteCubit.get(context).addNote(note);
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isSelected, required this.color}) : super(key: key);
  final bool isSelected;
  final Color color ;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ?  CircleAvatar(
      radius: 23,
      backgroundColor: Colors.white,
          child: CircleAvatar(
              radius: 20,
              backgroundColor: color,
            ),
        )
        :  CircleAvatar(
            radius: 20,
            backgroundColor: color,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  List<Color> colors = const[
    Color(0xffEF7C8E),
    Color(0xffFAE8E0),
    Color(0xffB6E2D3),
    Color(0xffD8A7B1),
    Color(0xff2E765E),
    Color(0xff638C80),
    Color(0xff887BB0),
    Color(0xffFFF4BD),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: InkWell(
                onTap: () {
                  currentIndex = index;
                  setState(() {});
                },
                child:  ColorItem(
                  isSelected: currentIndex == index,
                  color: colors[index],
                )),
          );
        },
      ),
    );
  }
}
