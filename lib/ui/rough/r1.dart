import 'package:flutter/material.dart';
import 'package:talenty_app/core/constants/colors.dart';

class roughScreen extends StatelessWidget {
  roughScreen({super.key});

  @override
  final List<String> names = ['shayanZahid', 'zeeeshan', 'faisal', 'hamad'];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int i) {
              return Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: Container(color: blackColor, height: 100, width: 50),
              );
            },
          ),
        ],
      ),
    );
  }
}
