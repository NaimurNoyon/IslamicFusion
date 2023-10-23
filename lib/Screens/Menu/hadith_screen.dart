import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/app_colors.dart';

class HadithScreen extends StatefulWidget {
  const HadithScreen({Key? key}) : super(key: key);

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimaryLighter,
      appBar: AppBar(
        //centerTitle: true,
        title: Text(
          "Hadith",
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.colorRed, AppColors.colorText],
            // Replace with your desired colors
            begin: Alignment.centerLeft,
            // Adjust the alignment as needed
            end: Alignment.centerRight,
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.h, vertical: 24.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(500.h),
              topRight: Radius.circular(500.h),
            )
          ),
        ),
      ),
    );
  }
}
