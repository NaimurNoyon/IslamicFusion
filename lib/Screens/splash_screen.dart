import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import '../Constants/custom_page_route.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    // Use Future.delayed to navigate after 3 seconds
    Future.delayed(const Duration(seconds: 1), () {
      // Use the custom page transition animation when navigating
      Navigator.of(context).pushReplacement(
        CustomPageRouteBottomToTop(
          builder: (context) => HomeScreen(),
        ),
      );
    });
  }

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Set the system UI overlay style
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, // Transparent status bar
      systemNavigationBarColor: Colors.black, // Background color of the navigation bar
      systemNavigationBarIconBrightness: Brightness.light, // Light icons (for dark background)
    ));
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset("assets/images/native_splash.jpg"),
      ),
    );
  }
}
