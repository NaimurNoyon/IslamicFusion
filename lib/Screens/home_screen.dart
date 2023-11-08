import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:islamic_fusion/Constants/app_colors.dart';
import 'package:islamic_fusion/Screens/compass_screen.dart';
import '../Constants/custom_page_route.dart';
import 'Menu/menu_screen.dart';
import 'package:adhan/adhan.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myCoordinates = Coordinates(23.9088, 89.1220); // Replace with your own location lat, lng.
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);
    return Scaffold(
      backgroundColor: AppColors.colorPrimaryLighter,
      appBar: AppBar(
        //centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "أَلسَّلَامُ عَلَيْكُمْ (As-salamu Alaykum)",
              style: GoogleFonts.sourceCodePro(
                color: AppColors.colorSecondary,
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.colorRed, AppColors.colorText], // Replace with your desired colors
              begin: Alignment.topLeft, // Adjust the alignment as needed
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /*AnalogClock(

              //secondHandColor: Colors.transparent,
              hourHandLengthFactor: 0.9,
              dateTime: DateTime.now(),
              isKeepTime: true,
              child: const Align(
                alignment: FractionalOffset(0.5, 0.75),
                child: Text('GMT-8'),
              ),
            ),*/
            Container(
              margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
              width: 200.w,
              height: 200.w,
              child: AnalogClock(
                dateTime: DateTime.now(),
                isKeepTime: true,
                dialColor: Colors.white,
                dialBorderColor: AppColors.colorSecondary,
                dialBorderWidthFactor: 0.05,
                markingColor: AppColors.colorPrimary,
                markingRadiusFactor: 1.0,
                markingWidthFactor: 1.0,
                hourNumberColor: AppColors.colorPrimary,
                hourNumbers: const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
                hourNumberSizeFactor: 0.5,
                hourNumberRadiusFactor: 1.05,
                hourHandColor: AppColors.colorRed,
                hourHandWidthFactor: 1.0,
                hourHandLengthFactor: 1.0,
                minuteHandColor: AppColors.colorSecondary,
                minuteHandWidthFactor: 1.0,
                minuteHandLengthFactor: 0.9,
                secondHandColor: AppColors.colorRed,
                secondHandWidthFactor: 1.0,
                secondHandLengthFactor: 0.8,
                centerPointColor: AppColors.colorRed,
                centerPointWidthFactor: 1.5,
              ),
            ),
            StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Text(
                  DateFormat('hh : mm : ss').format(DateTime.now()),
                  style: GoogleFonts.orbitron(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                );
              },
            ),
            Column(
              children: [
                Text(
                  "Prayers Time For Today",
                  style: GoogleFonts.sourceCodePro(
                    color: AppColors.colorRed,
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  DateFormat('d MMMM y').format(DateTime.now()),
                  style: GoogleFonts.sourceCodePro(
                    color: AppColors.colorSecondary,
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                        width: 150.w,
                        color: AppColors.colorSecondary,
                        child: const Center(child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('Fajr',style: TextStyle(color: AppColors.colorPrimary,fontWeight: FontWeight.bold),),
                        ),)
                    ),
                    Container(
                      color: Colors.white,
                      width: 150.w,
                      height: 125.h,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: AnalogClock(
                          dateTime: prayerTimes.fajr,
                          isKeepTime: false,
                          dialColor: Colors.white,
                          dialBorderColor: Colors.white,
                          dialBorderWidthFactor: 0.15,
                          markingColor: Colors.black,
                          markingRadiusFactor: 1.0,
                          markingWidthFactor: 1.0,
                          hourNumberColor: Colors.black,
                          hourNumbers: const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
                          hourNumberSizeFactor: 0.5,
                          hourNumberRadiusFactor: 1.05,
                          hourHandColor: AppColors.colorRed,
                          hourHandWidthFactor: 1.0,
                          hourHandLengthFactor: 1.0,
                          minuteHandColor: AppColors.colorSecondary,
                          minuteHandWidthFactor: 1.0,
                          minuteHandLengthFactor: 0.9,
                          secondHandColor: Colors.white,
                          secondHandWidthFactor: 1.0,
                          secondHandLengthFactor: 0.8,
                          centerPointColor: AppColors.colorRed,
                          centerPointWidthFactor: 1.0,
                        ),
                      ),
                    ),
                    Container(
                        height: 25.h,
                        width: 156.w,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [AppColors.colorRed, AppColors.colorText], // Replace with your desired colors
                            begin: Alignment.topLeft, // Adjust the alignment as needed
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Center(child: Text(DateFormat.jm().format(prayerTimes.fajr),style: TextStyle(color: AppColors.colorSecondary, fontWeight: FontWeight.bold)))
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                        width: 150.w,
                        color: AppColors.colorSecondary,
                        child: Center(child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text("Dhuhr",style: TextStyle(color: AppColors.colorPrimary,fontWeight: FontWeight.bold),),
                        ),)
                    ),
                    Container(
                      color: Colors.white,
                      width: 150.w,
                      height: 125.h,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: AnalogClock(
                          dateTime: prayerTimes.dhuhr,
                          isKeepTime: false,
                          dialColor: Colors.white,
                          dialBorderColor: Colors.white,
                          dialBorderWidthFactor: 0.15,
                          markingColor: Colors.black,
                          markingRadiusFactor: 1.0,
                          markingWidthFactor: 1.0,
                          hourNumberColor: Colors.black,
                          hourNumbers: const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
                          hourNumberSizeFactor: 0.5,
                          hourNumberRadiusFactor: 1.05,
                          hourHandColor: AppColors.colorRed,
                          hourHandWidthFactor: 1.0,
                          hourHandLengthFactor: 1.0,
                          minuteHandColor: AppColors.colorSecondary,
                          minuteHandWidthFactor: 1.0,
                          minuteHandLengthFactor: 0.9,
                          secondHandColor: Colors.white,
                          secondHandWidthFactor: 1.0,
                          secondHandLengthFactor: 0.8,
                          centerPointColor: AppColors.colorRed,
                          centerPointWidthFactor: 1.0,
                        ),
                      ),
                    ),
                    Container(
                        height: 25.h,
                        width: 156.w,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [AppColors.colorRed, AppColors.colorText], // Replace with your desired colors
                            begin: Alignment.topLeft, // Adjust the alignment as needed
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Center(child: Text(DateFormat.jm().format(prayerTimes.dhuhr),style: const TextStyle(color: AppColors.colorSecondary, fontWeight: FontWeight.bold)))
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                          width: 150.w,
                          color: AppColors.colorSecondary,
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('Asr',style: TextStyle(color: AppColors.colorPrimary,fontWeight: FontWeight.bold),),
                          ),)
                      ),
                      Container(
                        color: Colors.white,
                        width: 150.w,
                        height: 125.h,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: AnalogClock(
                            dateTime: prayerTimes.asr,
                            isKeepTime: false,
                            dialColor: Colors.white,
                            dialBorderColor: Colors.white,
                            dialBorderWidthFactor: 0.15,
                            markingColor: Colors.black,
                            markingRadiusFactor: 1.0,
                            markingWidthFactor: 1.0,
                            hourNumberColor: Colors.black,
                            hourNumbers: const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
                            hourNumberSizeFactor: 0.5,
                            hourNumberRadiusFactor: 1.05,
                            hourHandColor: AppColors.colorRed,
                            hourHandWidthFactor: 1.0,
                            hourHandLengthFactor: 1.0,
                            minuteHandColor: AppColors.colorSecondary,
                            minuteHandWidthFactor: 1.0,
                            minuteHandLengthFactor: 0.9,
                            secondHandColor: Colors.white,
                            secondHandWidthFactor: 1.0,
                            secondHandLengthFactor: 0.8,
                            centerPointColor: AppColors.colorRed,
                            centerPointWidthFactor: 1.0,
                          ),
                        ),
                      ),
                      Container(
                          height: 25.h,
                          width: 156.w,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [AppColors.colorRed, AppColors.colorText], // Replace with your desired colors
                              begin: Alignment.topLeft, // Adjust the alignment as needed
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Center(child: Text(DateFormat.jm().format(prayerTimes.asr),style: TextStyle(color: AppColors.colorSecondary, fontWeight: FontWeight.bold)))
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          width: 150.w,
                          color: AppColors.colorSecondary,
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('Maghrib',style: TextStyle(color: AppColors.colorPrimary,fontWeight: FontWeight.bold),),
                          ),)
                      ),
                      Container(
                        color: Colors.white,
                        width: 150.w,
                        height: 125.h,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: AnalogClock(
                            dateTime: prayerTimes.maghrib,
                            isKeepTime: false,
                            dialColor: Colors.white,
                            dialBorderColor: Colors.white,
                            dialBorderWidthFactor: 0.15,
                            markingColor: Colors.black,
                            markingRadiusFactor: 1.0,
                            markingWidthFactor: 1.0,
                            hourNumberColor: Colors.black,
                            hourNumbers: const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
                            hourNumberSizeFactor: 0.5,
                            hourNumberRadiusFactor: 1.05,
                            hourHandColor: AppColors.colorRed,
                            hourHandWidthFactor: 1.0,
                            hourHandLengthFactor: 1.0,
                            minuteHandColor: AppColors.colorSecondary,
                            minuteHandWidthFactor: 1.0,
                            minuteHandLengthFactor: 0.9,
                            secondHandColor: Colors.white,
                            secondHandWidthFactor: 1.0,
                            secondHandLengthFactor: 0.8,
                            centerPointColor: AppColors.colorRed,
                            centerPointWidthFactor: 1.0,
                          ),
                        ),
                      ),
                      Container(
                          height: 25.h,
                          width: 156.w,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [AppColors.colorRed, AppColors.colorText], // Replace with your desired colors
                              begin: Alignment.topLeft, // Adjust the alignment as needed
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Center(child: Text(DateFormat.jm().format(prayerTimes.maghrib),style: TextStyle(color: AppColors.colorSecondary, fontWeight: FontWeight.bold)))
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                          width: 150.w,
                          color: AppColors.colorSecondary,
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Isha",style: TextStyle(color: AppColors.colorPrimary,fontWeight: FontWeight.bold),),
                          ),)
                      ),
                      Container(
                        color: Colors.white,
                        width: 150.w,
                        height: 125.h,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: AnalogClock(
                            dateTime: prayerTimes.isha,
                            isKeepTime: false,
                            dialColor: Colors.white,
                            dialBorderColor: Colors.white,
                            dialBorderWidthFactor: 0.15,
                            markingColor: Colors.black,
                            markingRadiusFactor: 1.0,
                            markingWidthFactor: 1.0,
                            hourNumberColor: Colors.black,
                            hourNumbers: const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
                            hourNumberSizeFactor: 0.5,
                            hourNumberRadiusFactor: 1.05,
                            hourHandColor: AppColors.colorRed,
                            hourHandWidthFactor: 1.0,
                            hourHandLengthFactor: 1.0,
                            minuteHandColor: AppColors.colorSecondary,
                            minuteHandWidthFactor: 1.0,
                            minuteHandLengthFactor: 0.9,
                            secondHandColor: Colors.white,
                            secondHandWidthFactor: 1.0,
                            secondHandLengthFactor: 0.8,
                            centerPointColor: AppColors.colorRed,
                            centerPointWidthFactor: 1.0,
                          ),
                        ),
                      ),
                      Container(
                          height: 25.h,
                          width: 156.w,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [AppColors.colorRed, AppColors.colorText], // Replace with your desired colors
                              begin: Alignment.topLeft, // Adjust the alignment as needed
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Center(child: Text(DateFormat.jm().format(prayerTimes.isha),style: TextStyle(color: AppColors.colorSecondary, fontWeight: FontWeight.bold)))
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h,)
          ],
        ),
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
              onTap: (){

              },
              child: SvgPicture.asset(
                  'assets/images/home_icon.svg',
                height: 50.w,
                width: 50.w,
                color: AppColors.colorSecondary,
              ),
            ),
            InkWell(
              onTap: (){
                // Use the custom page transition animation when navigating
                Navigator.of(context).pushReplacement(
                  CustomPageRouteRightToLeft(
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