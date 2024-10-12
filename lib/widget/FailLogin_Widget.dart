import 'package:flutter/material.dart';

class FailLoginDialog extends StatelessWidget {
  const FailLoginDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Failed"),
      content: const SingleChildScrollView(
        child: Column(
          children: [
            Text("Failed to authenticate user")
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () { Navigator.of(context).pop();}, child: const Text("Close"))
      ],
    );
  }
}