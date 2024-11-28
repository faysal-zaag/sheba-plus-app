import 'package:flutter/material.dart';

class OrderStatus extends StatelessWidget {
  final Color color;
  final String status;
  const OrderStatus({super.key, required this.color, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(6.0)
      ),
      child: Center(
        child: Text(status, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: color),),
      ),
    );
  }
}
