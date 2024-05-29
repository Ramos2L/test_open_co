import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/random_images.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String body;
  final Function() onPressed;

  const CardWidget({super.key, required this.title, required this.body, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: [
          SvgPicture.asset(
            RandomImages.images(),
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title, style: TextStyle(fontSize: 22, color: Colors.grey[800])),
                Container(height: 10),
                Text(body, style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(foregroundColor: Colors.transparent),
                      onPressed: onPressed,
                      child: const Text("COMMENT", style: TextStyle(color: Colors.lightGreen)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(height: 10),
        ],
      ),
    );
  }
}
