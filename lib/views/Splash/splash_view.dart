import 'package:flutter/material.dart';
import 'package:kilo_client_app/theme/resource/colors.dart';
import 'package:kilo_client_app/theme/resource/dimens.dart';
import 'package:kilo_client_app/views/Splash/splash_steps_view.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();

    // Delay for 3 seconds and navigate to the next screen
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => const SplashStepsView()),
    //   );
    // });
  }

  void _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 2));

    // Request location permission
    PermissionStatus status = await Permission.location.request();

    // Check the permission status
    if (status.isGranted) {
      // If permission is granted, navigate to the next page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const SplashStepsView()), // Replace NextPage with your actual next page widget
      );
    } else if (status.isDenied || status.isPermanentlyDenied) {
      // Handle if the user denied or permanently denied the permission
      // You can either show a dialog or navigate to a different screen
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Location Permission Required'),
          content: Text('Please grant location permission to continue.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                // Retry requesting the permission
                PermissionStatus newStatus =
                    await Permission.location.request();
                if (newStatus.isGranted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SplashStepsView()),
                  );
                }
              },
              child: Text('Retry'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 100,
              ),
            ),
          ),
          Image.asset(
            "assets/images/splash_background.png",
            width: double.infinity,
          ),
          const Padding(
            padding: EdgeInsets.all(Dimens.MARGIN_LARGE),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Powered by Kilo Taxi Service",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Version 1.0",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
