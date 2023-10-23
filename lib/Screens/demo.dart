import 'package:flutter/material.dart';

import '../Constants/app_colors.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.colorRed, AppColors.colorText], // Replace with your desired colors
            begin: Alignment.centerLeft, // Adjust the alignment as needed
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
