import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/core/constants/constants.dart';
import 'package:spotify_clone/features/onboarding/choose_mode/choose_mode_view.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
              child: Image.asset(
            'assets/cover/start_screen.png',
            fit: BoxFit.cover,
          )),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                const SizedBox(height: 64),
                Center(
                  child: SvgPicture.asset(
                    'assets/logos/logo_spotify.svg',
                    height: 60,
                  ),
                ),
                const Spacer(),
                const Text(
                  'Enjoy Listening To Music',
                  style: AppTextStyles.headline,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus.',
                  style: AppTextStyles.subtitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChooseModeView()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                    ),
                    child: const Text(
                      'Get Started',
                      style: AppTextStyles.button,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
