import 'package:flutter/material.dart';

class KDefaultButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final Color? color, textColor;
  final double? fontSize;
  final double? height;
  final double? width;
  final FontWeight? fontWeight;

  const KDefaultButton(
      {super.key,
      this.text,
      this.onPressed,
      this.color,
      this.fontSize,
      this.textColor,
      this.height,
      this.width,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
