import 'package:flutter/material.dart';
import 'package:kilo_client_app/theme/resource/colors.dart';
import 'package:kilo_client_app/views/Splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM with BLoC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: PRIMARY_COLOR,
          onPrimary: TEXT_COLOR,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: WHITE_COLOR,
          surfaceTintColor: Color(0xFFF5F5F5),
          elevation: 0, // Optional: remove shadow,
          shadowColor: GREY_COLOR,
          centerTitle: true, // Optional: center titles by default
          titleTextStyle: TextStyle(
            color: BLACK_COLOR,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: const SplashView(),
      // initialRoute: RouteClass.homepage,
    );
  }
}
