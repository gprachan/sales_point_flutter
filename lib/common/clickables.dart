import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  const ClickableText({
    Key? key,
    required this.label,
    this.color = Colors.green,
    required this.onClick,
  }) : super(key: key);

  final String label;
  final Function onClick;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      radius: 16,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
