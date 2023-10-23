import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/app_colors.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimaryLighter,
      appBar: AppBar(
        //centerTitle: true,
        title: Text(
          "Privacy Policy",
          style: GoogleFonts.sourceCodePro(
            color: AppColors.colorWhiteHighEmp,
            textStyle: Theme
                .of(context)
                .textTheme
                .displayLarge,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.colorRed, AppColors.colorText],
              // Replace with your desired colors
              begin: Alignment.centerLeft,
              // Adjust the alignment as needed
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
    );
  }
}
