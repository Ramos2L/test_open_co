import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Comments')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('This is initial page'),
            ElevatedButton(
              onPressed: () => Modular.to.pop(),
              child: const Text('Navigate to Back Page'),
            ),
          ],
        ),
      ),
    );
  }
}
