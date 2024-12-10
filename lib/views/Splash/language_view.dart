import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:kilo_client_app/theme/resource/colors.dart';
import 'package:kilo_client_app/theme/resource/dimens.dart';
import 'package:kilo_client_app/views/Splash/login_view.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView>
    with SingleTickerProviderStateMixin {
  String? _selectedOption = "en";
  String errorMessage = '';
  late AnimationController _animationController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    // Animation controller for fading effect
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true); // Repeat the animation back and forth
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Simulate a loading delay
  void _onConfirm() {
    if (_selectedOption == null) {
      setState(() {
        errorMessage = 'Please select a language';
      });
    } else {
      setState(() {
        errorMessage = ''; // Clear error if a language is selected
        _isLoading = true; // Show loading overlay
      });

      // Simulate a 2-second delay for loading
      Timer(const Duration(seconds: 3), () {
        setState(() {
          _isLoading = false; // Hide loading overlay after 2 seconds
        });

        // Proceed with the next action after loading (e.g., navigate to another screen)
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginView()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      progressIndicator: _buildLoadingWidget(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Dimens.MARGIN_LARGE),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 56,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 44, bottom: 18),
                      child: Text(
                        "Select Language",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: BLACK_COLOR),
                      ),
                    ),
                    const Text(
                      "You can change the language in your profile settings after signing in.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: BLACK_COLOR),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      focusColor: null,
                      title: const Text(
                        "English",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: BLACK_COLOR),
                      ),
                      leading: Icon(
                        size: 30,
                        _selectedOption == "en"
                            ? Icons.check_circle
                            : Icons.circle,
                        color: _selectedOption == "en"
                            ? PRIMARY_COLOR
                            : GREY_COLOR,
                      ),
                      onTap: () {
                        setState(() {
                          _selectedOption = "en";
                        });
                      },
                    ),
                    Container(
                      height: 1,
                      color: GREY_COLOR,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text(
                        "မြန်မာ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: BLACK_COLOR),
                      ),
                      leading: Icon(
                        size: 30,
                        _selectedOption == "mm"
                            ? Icons.check_circle
                            : Icons.circle,
                        color: _selectedOption == "mm"
                            ? PRIMARY_COLOR
                            : GREY_COLOR,
                      ),
                      onTap: () {
                        setState(() {
                          _selectedOption = "mm";
                        });
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    MaterialButton(
                        onPressed: _onConfirm,
                        // onPressed: () {
                        //   Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const LoginView()),
                        //   );
                        // },
                        color: PRIMARY_COLOR,
                        height: Dimens.BUTTON_COMMON_HEIGHT,
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(100), // Rounded corners
                        ),
                        elevation: 0,
                        child: const Text(
                          'Confirm',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo_0.png',
            height: 40,
          ),
          SizedBox(
            width: 10,
          ),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              wordSpacing: 1.2,
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                WavyAnimatedText('Best Kilo'),
              ],
              isRepeatingAnimation: true,
            ),
          )
        ],
      ),
    );
  }
}
