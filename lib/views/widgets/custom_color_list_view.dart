
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../cubits/add_note_cubit/add_note_cubit.dart';

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


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: InkWell(
                onTap: () {
                  currentIndex = index;
                  AddNoteCubit.get(context).color = kColors[index];
                  setState(() {});
                },
                child:  ColorItem(
                  isSelected: currentIndex == index,
                  color: kColors[index],
                )),
          );
        },
      ),
    );
  }
}
