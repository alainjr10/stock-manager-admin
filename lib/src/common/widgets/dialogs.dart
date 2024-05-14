import 'package:flutter/material.dart';

class ProductActionDialog extends StatelessWidget {
  const ProductActionDialog({
    super.key,
    required this.dialogTitle,
    required this.dialogContent,
    required this.dialogActionBtnText,
    required this.onActionBtnPressed,
  });
  final String dialogTitle;
  final String dialogContent;
  final String dialogActionBtnText;
  final VoidCallback onActionBtnPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(dialogTitle),
      content: Text(dialogContent),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: onActionBtnPressed,
          child: Text(dialogActionBtnText),
        ),
      ],
    );
  }
}
