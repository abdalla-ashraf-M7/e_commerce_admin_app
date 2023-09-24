import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class CustomChooseTitle extends StatelessWidget {
  const CustomChooseTitle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      child: Text(
        text,
        style: const TextStyle(color: Appcolors.grey4, fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
