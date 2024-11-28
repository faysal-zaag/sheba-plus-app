import 'package:flutter/material.dart';

class DrawerMenuItem extends StatelessWidget {
  final String title;
  final Widget? suffix;

  const DrawerMenuItem({super.key, required this.title, this.suffix});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          if (suffix != null)
            Expanded(
              child: SizedBox(
                child: suffix,
              ),
            ),
        ],
      ),
    );
  }
}
