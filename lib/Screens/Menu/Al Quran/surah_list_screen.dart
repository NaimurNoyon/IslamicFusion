import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:islamic_fusion/Screens/Menu/Al%20Quran/indivudual_surah_screen.dart';
import '../../../Constants/app_colors.dart';
import '../../../Models/surah_list_model.dart';

class SurahListScreen extends StatefulWidget {
  const SurahListScreen({Key? key}) : super(key: key);

  @override
  State<SurahListScreen> createState() => _SurahListScreenState();
}

class _SurahListScreenState extends State<SurahListScreen> {
  List<Data> surahList = [];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimaryLighter,
      body: ListView.builder(
        itemCount: surahList.length + 1, // Add one extra item for the SizedBox
        itemBuilder: (context, index) {
          if (index < surahList.length) {
            final surah = surahList[index];
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SurahScreen(
                          index: index,
                          surahNameAr: surah.name!.long!,
                          surahNameEn: surah.name!.transliteration!.en!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 64.h,
                    width: 328.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.colorPrimary,
                    ),
                    child: ListTile(
                      leading: Container(
                        height: 45.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                          color: AppColors.colorPrimary,
                        ),
                        child: Center(
                          child: Text(
                            surah.number.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        surah.name?.long ?? '',
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        surah.name?.transliteration?.en ?? '',
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                )
              ],
            );
          } else {
            // This block adds a SizedBox at the end of the ListView
            return SizedBox(height: 50.h);
          }
        },
      ),
    );
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    final response =
    await http.get(Uri.parse('https://api.quran.gading.dev/surah'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final surahListModel = SurahListModel.fromJson(jsonResponse);

      setState(() {
        surahList = surahListModel.data ?? [];
        isLoading = false;
      });
    } else {
      // Handle error
      print('Request failed with status: ${response.statusCode}');
      setState(() {
        isLoading = false;
      });
    }
  }
}
