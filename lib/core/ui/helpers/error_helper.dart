import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teste_open_co/core/ui/styles/images.dart';

class ErrorHelper extends StatelessWidget {
  final String? message;
  final String? messageButton;
  final VoidCallback? onPressedButton;

  const ErrorHelper({super.key, this.message, this.messageButton, this.onPressedButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedButton,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            context.images.bug,
            height: 190,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 30),
          Center(
            child: Text(
              message ?? 'Ops! Ocorreu um erro...',
              style: TextStyle(fontSize: 24, color: Colors.grey[800]),
            ),
          ),
          const SizedBox(height: 30),
          Icon(Icons.refresh, size: 40, color: Colors.grey[800]),
        ],
      ),
    );
  }
}
