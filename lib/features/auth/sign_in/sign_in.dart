import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/core/constants/constants.dart';
import 'package:spotify_clone/features/auth/widgets/shared_auth_widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButton(color: Colors.white),
              const SizedBox(height: 24),
              Center(
                child: SvgPicture.asset('assets/logos/logo_spotify.svg'),
              ),
              const SizedBox(height: 24),
              const Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text.rich(
                  TextSpan(
                    text: 'If You Need Any Support ',
                    style: TextStyle(color: AppColors.textSecondary),
                    children: [
                      TextSpan(
                        text: 'Click Here',
                        style: TextStyle(color: AppColors.linkBlue),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const InputField(hint: 'Enter Username Or Email'),
              const SizedBox(height: 16),
              const InputField(hint: 'Password', obscureText: true),
              const SizedBox(height: 12),
              const Text(
                'Recovery Password',
                style: TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 24),
              const GreenButton(text: 'Sign In'),
              const SizedBox(height: 16),
              const DividerWithText(),
              const SizedBox(height: 16),
              const LoginIcons(),
              const SizedBox(height: 16),
              const Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Not A Member ? ',
                    style: TextStyle(color: AppColors.textSecondary),
                    children: [
                      TextSpan(
                        text: 'Register Now',
                        style: TextStyle(color: AppColors.linkBlue),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
