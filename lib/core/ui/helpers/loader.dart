import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final double? value;
  final Color? backgroundColor;
  final Color? valueColor;

  const Loader({super.key, this.value, this.backgroundColor, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CircularProgressIndicator.adaptive(
            backgroundColor: backgroundColor ??  Colors.green,
            valueColor: AlwaysStoppedAnimation<Color>(valueColor ?? Colors.green),
          ),
        ),
      ],
    );
  }
}
