import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class CustomGridCardHome extends StatelessWidget {
  const CustomGridCardHome({super.key, required this.text, required this.url, this.onCardTap});
  final String text;
  final String url;
  final void Function()? onCardTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 75,
              //color: Colors.red,
              child: Image.asset(
                url,
                height: 80,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              child: Text(
                text,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Appcolors.primarycolor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
