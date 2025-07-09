import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';

class CharacterCounterRow extends StatelessWidget {
  final String? error;
  final int currentLength;
  final int maxLength;
  final String label;

  const CharacterCounterRow({super.key, 
    required this.error,
    required this.currentLength,
    required this.maxLength,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: SizedBox(
            height: 20,
            child:
                error != null
                    ? Text(
                      error!,
                      style: TextStyle(color: Colors.red, fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    )
                    : null,
          ),
        ),
        SizedBox(width: 8),
        Text(
          '$currentLength/$maxLength ${label.tr}',
          style: style14M.copyWith(
            color: currentLength > maxLength ? Colors.red : textGreyColor,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
