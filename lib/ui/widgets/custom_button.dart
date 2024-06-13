import 'package:flutter/material.dart';
import 'package:wise/ui/common/app_colors.dart';
import 'package:wise/ui/common/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
  });

  final Color backgroundColor;
  final IconData icon;
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            minimumSize: const Size(65, 20), backgroundColor: backgroundColor),
        child: Row(children: [
          Icon(
            icon,
            size: 20,
            color: kcBlackColor,
          ),
          Text(
            text,
            style: kBodyTextStyle.copyWith(color: kcBlackColor),
          )
        ]));
  }
}
