import 'package:flutter/material.dart';

class CustomPadding extends StatelessWidget {
  const CustomPadding({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 24), child: child);
  }
}
