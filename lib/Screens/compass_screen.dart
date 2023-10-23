import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants/app_colors.dart';
import '../Constants/custom_page_route.dart';
import 'Menu/menu_screen.dart';
import 'home_screen.dart';

class CompassScreen extends StatefulWidget {
  const CompassScreen({Key? key}) : super(key: key);

  @override
  State<CompassScreen> createState() => _CompassScreenState();
}

class _CompassScreenState extends State<CompassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimaryLighter,
      appBar: AppBar(
        //centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Qibla Compass",
              style: GoogleFonts.sourceCodePro(
                color: AppColors.colorSecondary,
                textStyle: Theme
                    .of(context)
                    .textTheme
                    .displayLarge,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.colorRed, AppColors.colorText],
              // Replace with your desired colors
              begin: Alignment.topLeft,
              // Adjust the alignment as needed
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Center(
              child: SizedBox(
                width: 300.w,
                  height: 300.w,
                  child: Image.asset('assets/images/compass_circle.png')
              )
          ),
          Center(
            child: SvgPicture.asset(
              'assets/images/qibla_compass.svg',
              color: AppColors.colorSecondary,
              width: 130.w,
              height: 130.w,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70.h,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          gradient: LinearGradient(
            colors: [AppColors.colorRed, AppColors.colorText], // Replace with your desired colors
            begin: Alignment.topLeft, // Adjust the alignment as needed
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: (){

              },
              child: SvgPicture.asset(
                'assets/images/compass_icon.svg',
                height: 40.w,
                width: 40.w,
                color: AppColors.colorSecondary,
              ),
            ),
            InkWell(
              onTap: (){
                // Use the custom page transition animation when navigating
                Navigator.of(context).pushReplacement(
                  CustomPageRouteBottomToTop(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: SvgPicture.asset(
                'assets/images/home_icon.svg',
                height: 40.w,
                width: 40.w,
                color: AppColors.colorPrimary,
              ),
            ),
            InkWell(
              onTap: (){
                // Use the custom page transition animation when navigating
                Navigator.of(context).pushReplacement(
                  CustomPageRouteBottomToTop(
                    builder: (context) => const MenuScreen(),
                  ),
                );
              },
              child: SvgPicture.asset(
                'assets/images/menu_icon.svg',
                height: 40.w,
                width: 40.w,
                color: AppColors.colorPrimary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
