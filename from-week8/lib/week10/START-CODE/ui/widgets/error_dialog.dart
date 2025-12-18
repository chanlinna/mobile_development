import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String content;

  const ErrorDialog({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Invalid Input"),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    );
  }
}