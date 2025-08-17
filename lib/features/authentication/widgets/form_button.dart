import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  const FormButton({super.key, 
    required this.disabled,
  });

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: disabled ? Colors.grey : Colors.pink,
          borderRadius: BorderRadius.circular(18),
        ),
        child: AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 300),
          style: TextStyle(
            color: disabled ? Colors.grey.shade600 : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          child: Text(
            "Next",
            textAlign: TextAlign.center,
          )
        )
      ),
    );
  }
}