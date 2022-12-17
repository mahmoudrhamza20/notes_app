import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key, required this.tittle, required this.icon, this.onPressed})
      : super(key: key);
  final String tittle;

  final IconData icon;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          tittle,
          style: const TextStyle(fontSize: 28),
        ),
        const Spacer(),
        CustomSearchIcon(
          icon: icon,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
