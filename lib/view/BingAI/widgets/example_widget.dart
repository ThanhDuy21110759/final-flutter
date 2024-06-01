// ExampleWidget is a simple widget that displays a text in a container with a dark grey background color.
// Ho Thanh Duy 21110759
import 'package:flutter/material.dart';

import '../../../constraint/colors.dart';

class ExampleWidget extends StatelessWidget {
  final String text;

  const ExampleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: CustomColors.darkGrey,
        borderRadius: BorderRadius.circular(8)
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 36),
      child: Text(text, style: textTheme.bodyLarge?.copyWith(color: Colors.white), textAlign: TextAlign.center),
    );
  }
}
