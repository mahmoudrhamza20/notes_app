
import 'package:flutter/material.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20,bottom: 20,left: 14),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(16),
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Text('Flutter Tips',style: TextStyle(fontSize: 24,color: Colors.black),),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text('Build your career with mahmoud reda',style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(.4),),),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete,color: Colors.black,size: 26,),
              onPressed: () {  },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24,top: 16,),
            child: Text('May 21,2022',style: TextStyle(fontSize: 14,color: Colors.black.withOpacity(.4),),),
          ),
        ],
      ),


    );
  }
}