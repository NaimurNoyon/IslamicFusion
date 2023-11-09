import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import '../../../Constants/app_colors.dart';
import '../../../Models/al_quran_surah_model.dart';

class SurahScreen extends StatefulWidget {
  final int index;
  final String surahNameAr, surahNameEn;

  const SurahScreen(
      {Key? key,
      required this.index,
      required this.surahNameAr,
      required this.surahNameEn})
      : super(key: key);

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  List<Verses>? versesList;
  @override
  void initState() {
    super.initState();
    fetchSurahData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimaryLighter,
      body:versesList == null
          ? Center(
          child: Center(
              child: Container(
                height: 96,
                width: 96,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: AppColors.colorPrimaryDark,
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    )),
              )))
          :  ListView.builder(
        itemCount: versesList!.length,
        itemBuilder: (context, index) {
          final verse = versesList![index];
          return Column(
            children: [
              ListTile(
                title: Text(
                  verse.text?.arab ?? '',
                  style: TextStyle(
                      color: Colors.white, fontSize: 14.sp),
                ),
                subtitle: Text(
                  verse.translation?.en ?? '',
                  style: TextStyle(
                      color: Colors.white, fontSize: 14.sp),
                ),
              ),
              SizedBox(
                  height: 10.h
              )
            ],
          );
        },
      ),
    );
  }
  Future<void> fetchSurahData() async {
    final response = await http.get(
        Uri.parse('https://api.quran.gading.dev/surah/${widget.index + 1}'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final data = AlQuranSurahModel.fromJson(jsonData);

      setState(() {
        versesList = data.data?.verses;
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
