import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_fusion/Constants/app_colors.dart';
import 'package:islamic_fusion/Screens/Menu/dua_screen.dart';
import 'package:islamic_fusion/Screens/Menu/hadith_screen.dart';
import 'package:islamic_fusion/Screens/Menu/privacy_screen.dart';
import 'package:islamic_fusion/Screens/Menu/tasbih_counter_screen.dart';

import '../../Constants/custom_page_route.dart';
import '../compass_screen.dart';
import '../home_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimaryLighter,
      appBar: AppBar(
        //centerTitle: true,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Menu",
              style: GoogleFonts.sourceCodePro(
                color: AppColors.colorSecondary,
                textStyle: Theme.of(context).textTheme.displayLarge,
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
      body: Column(
        children: [
          Container(
            height: 65.h,
            width: double.infinity,
            //margin: EdgeInsets.symmetric(vertical: 8.w),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.colorText, AppColors.colorRed],
                // Replace with your desired colors
                begin: Alignment.topLeft,
                // Adjust the alignment as needed
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Text(
                'Al Quran',
                style: GoogleFonts.sourceCodePro(
                  color: AppColors.colorWhiteHighEmp,
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 20.sp,
                  //fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Use the custom page transition animation when navigating
              Navigator.of(context).push(
                CustomPageRouteBottomToTop(
                  builder: (context) => const HadithScreen(),
                ),
              );
            },
            child: Container(
              height: 65.h,
              width: double.infinity,
              //margin: EdgeInsets.symmetric(vertical: 8.w),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.colorRed, AppColors.colorText],
                  // Replace with your desired colors
                  begin: Alignment.topLeft,
                  // Adjust the alignment as needed
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  'Hadith',
                  style: GoogleFonts.sourceCodePro(
                    color: AppColors.colorWhiteHighEmp,
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 20.sp,
                    //fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Use the custom page transition animation when navigating
              Navigator.of(context).push(
                CustomPageRouteBottomToTop(
                  builder: (context) => const DuaScreen(),
                ),
              );
            },
            child: Container(
              height: 65.h,
              width: double.infinity,
              //margin: EdgeInsets.only(bottom: 8.w),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.colorText, AppColors.colorRed],
                  // Replace with your desired colors
                  begin: Alignment.topLeft,
                  // Adjust the alignment as needed
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  'Dua',
                  style: GoogleFonts.sourceCodePro(
                    color: AppColors.colorWhiteHighEmp,
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 20.sp,
                    //fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Use the custom page transition animation when navigating
              Navigator.of(context).push(
                CustomPageRouteBottomToTop(
                  builder: (context) => const TasbihCounter(),
                ),
              );
            },
            child: Container(
              height: 65.h,
              width: double.infinity,
              //margin: EdgeInsets.only(bottom: 8.w),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.colorRed, AppColors.colorText],
                  // Replace with your desired colors
                  begin: Alignment.topLeft,
                  // Adjust the alignment as needed
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  'Tasbhi Counter',
                  style: GoogleFonts.sourceCodePro(
                    color: AppColors.colorWhiteHighEmp,
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 20.sp,
                    //fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              // Use the custom page transition animation when navigating
              Navigator.of(context).push(
                CustomPageRouteBottomToTop(
                  builder: (context) => const PrivacyScreen(),
                ),
              );
            },
            child: Container(
              height: 65.h,
              width: double.infinity,
              //margin: EdgeInsets.symmetric(vertical: 8.w),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.colorText, AppColors.colorRed],
                  // Replace with your desired colors
                  begin: Alignment.topLeft,
                  // Adjust the alignment as needed
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  'Privacy Policy',
                  style: GoogleFonts.sourceCodePro(
                    color: AppColors.colorWhiteHighEmp,
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 20.sp,
                    //fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70.h,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          gradient: LinearGradient(
            colors: [AppColors.colorRed, AppColors.colorText],
            // Replace with your desired colors
            begin: Alignment.topLeft,
            // Adjust the alignment as needed
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                // Use the custom page transition animation when navigating
                Navigator.of(context).pushReplacement(
                  CustomPageRouteLeftToRight(
                    builder: (context) => const CompassScreen(),
                  ),
                );
              },
              child: SvgPicture.asset(
                'assets/images/compass_icon.svg',
                height: 40.w,
                width: 40.w,
                color: AppColors.colorPrimary,
              ),
            ),
            InkWell(
              onTap: () {
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
              onTap: () {},
              child: SvgPicture.asset(
                'assets/images/menu_icon.svg',
                height: 40.w,
                width: 40.w,
                color: AppColors.colorSecondary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
