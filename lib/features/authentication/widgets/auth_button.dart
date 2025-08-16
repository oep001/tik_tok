import 'package:flutter/material.dart';
import 'package:tik_tok/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;

  const AuthButton({
      super.key,
      required this.text,
      required this.icon,
      });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding:EdgeInsets.symmetric(
          vertical: Sizes.size12,
          horizontal: 21,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black,
            width: 1,
          )
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: icon
              ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight:FontWeight.w600,
              )
            ),
          ],
        ),
      ),
    );
  }
}