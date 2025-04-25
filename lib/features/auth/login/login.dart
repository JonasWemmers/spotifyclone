import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/core/constants/constants.dart';
import 'package:spotify_clone/core/utils/trl.dart'; // oder wo auch immer trl() definiert ist

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/icons/vektor_1.svg',
              width: 160,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/icons/vektor_1.svg',
              width: 160,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/cover/15mag-billie-03-master675-v3 1.png',
              width: 300,
            ),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white),
                        onPressed: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          } else {
                            context.go('/choose-mode');
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                    SvgPicture.asset(
                      'assets/logos/logo_spotify.svg',
                      height: 48,
                    ),
                    const SizedBox(height: 48),
                    Text(
                      trl('login.headline'),
                      style: AppTextStyles.headline,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      trl('login.subtitle'),
                      style: AppTextStyles.subtitle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.go('/register');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                          ),
                          child: Text(
                            trl('login.register'),
                            style: AppTextStyles.button,
                          ),
                        ),
                        const SizedBox(width: 24),
                        TextButton(
                          onPressed: () {
                            context.go('/sign-in');
                          },
                          child: Text(
                            trl('login.sign_in'),
                            style: AppTextStyles.button,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
