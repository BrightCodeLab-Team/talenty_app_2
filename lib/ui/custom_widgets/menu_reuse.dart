// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:talenty_app/core/constants/colors.dart';

import 'package:talenty_app/core/constants/text_style.dart';

class MenuReuse extends StatelessWidget {
  final leading;
  final String title;
  const MenuReuse({required this.leading, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title, style: style14M),
      trailing: Icon(Icons.arrow_forward_ios, size: 20, color: lightBlackColor),
      onTap: () {},
    );
  }
}
