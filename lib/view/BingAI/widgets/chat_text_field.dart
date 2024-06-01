// Fake Chat Text Field
// Fake Chat Text Field for Bing AI Chat Screen
// Ho Thanh Duy 21110759
import 'package:flutter/material.dart';

import '../../../constraint/colors.dart';

class ChatTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?) onSubmitted;

  const ChatTextField(
      {super.key, required this.controller, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black, width: .8)),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Flexible(
            child: TextField(
              controller: controller,
              cursorColor: Colors.black,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              onPressed: () {
                onSubmitted(controller.text);
              },
              style: IconButton.styleFrom(
                  backgroundColor: CustomColors.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4))),
              icon: const Icon(Icons.send_outlined),
            ),
          )
        ],
      ),
    );
  }
}
