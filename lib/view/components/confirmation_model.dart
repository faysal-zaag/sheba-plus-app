import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String confirmationMessage;
  final String cancelText;
  final String okText;
  final VoidCallback onOkPressed;

  const ConfirmationDialog({super.key, required this.title, required this.confirmationMessage, required this.cancelText, required this.okText, required this.onOkPressed});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)),
      title: Text(title),
      content: Text(
        confirmationMessage,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            cancelText,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        TextButton(
          onPressed: onOkPressed,
          child: Text(
            okText,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],

    );
  }
}
