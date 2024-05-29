import 'package:flutter/material.dart';

import '../../../../core/utils/initials_name.dart';
import '../../../../core/utils/random_colors.dart';

class CardCommentsWidget extends StatelessWidget {
  final String email;
  final String name;
  final String body;
  const CardCommentsWidget({super.key, required this.email, required this.name, required this.body});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: RandomColors.getRandomColor(),
                  radius: 16,
                  child: Text(
                    InitialsName.nameUser(name: email).toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                Text(email),
              ],
            ),
          ),
          ListTile(title: Text(name), subtitle: Text(body)),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
