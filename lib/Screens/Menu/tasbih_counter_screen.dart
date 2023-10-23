import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/app_colors.dart';

class TasbihCounter extends StatefulWidget {
  const TasbihCounter({Key? key}) : super(key: key);

  @override
  State<TasbihCounter> createState() => _TasbihCounterState();
}

int countNumber = 0;

class _TasbihCounterState extends State<TasbihCounter> {
  final List<Color> colors = [
    Colors.lightGreen,
    Colors.blue,
    Colors.deepPurpleAccent,
    Colors.orange,
    Colors.greenAccent,
    Colors.white,
    Colors.deepOrangeAccent,
    Colors.limeAccent,
  ];

  Color getRandomColor() {
    final random = Random();
    return colors[random.nextInt(colors.length)];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.colorPrimaryLighter,
        appBar: AppBar(
          //centerTitle: true,
          title: Text(
            "Tasbih Counter",
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
                begin: Alignment.topLeft,
                // Adjust the alignment as needed
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Text(
              '$countNumber',
              style: TextStyle(
                  color: AppColors.colorSecondary,
                  fontSize: 100.sp,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 70.h,
            ),
            Container(
              height: 80.h,
              width: 300.w,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  /*BoxShadow(
                    color: AppColors.colorPrimary,
                  ),
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: -0.0,
                    blurRadius: 20.0,
                    offset: Offset(
                      1,
                      1,
                    ), // changes position of shadow
                  ),*/
                ],
              ),
              child: Swiper(
                loop: true,
                scrollDirection: Axis.horizontal,
                duration: 800,
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 200.w,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height: 60.h,
                          width: 60.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: getRandomColor(),
                            boxShadow: const [
                              BoxShadow(
                                //color: getRandomColor(),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(
                                  0,
                                  2,
                                ), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                onIndexChanged: (int demo) {
                  setState(() {
                    countNumber++;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 75.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.colorPrimaryDark,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.green,
                      ),
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: -0.0,
                        blurRadius: 20.0,
                        offset: Offset(
                          1,
                          1,
                        ), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                countNumber = 0;
                              });
                            },
                            child: const Icon(
                              Icons.refresh,
                              color: Colors.white,
                              size: 35,
                            )),
                        InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.save,
                              color: Colors.white,
                              size: 30,
                            )),
                        InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.history,
                              color: Colors.white,
                              size: 33,
                            )),
                        const Icon(
                          Icons.mode_night,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ));
  }
}
