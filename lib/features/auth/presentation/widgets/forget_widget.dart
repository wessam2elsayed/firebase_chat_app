import 'package:firebase_chat_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ForgetWidget extends StatelessWidget {
  final String txt;
  final VoidCallback onpressed;
  const ForgetWidget({super.key, required this.txt, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(onPressed: onpressed,
                  child: Text(txt,
                 
                 style:const TextStyle(
                  color: AppColors.red,
                  fontSize: 10,
                  fontWeight: FontWeight.w500
                 ),)),
    );
  }
}