import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/core/constants/constants.dart';
import 'package:spotify_clone/features/auth/widgets/shared_auth_widgets.dart';
import 'package:spotify_clone/core/utils/trl.dart'; // Importiere hier trl()

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              Center(
                child: Text(
                  trl('register.headline'), // Übersetzung des Titels
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: trl('register.subtitle_1'), // Übersetzung der ersten Zeile
                    style: const TextStyle(color: AppColors.textSecondary),
                    children: [
                      TextSpan(
                        text: trl('register.subtitle_2'), // Übersetzung des Links
                        style: const TextStyle(color: AppColors.linkBlue),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const InputField(hint: 'Full Name'),
              const SizedBox(height: 16),
              const InputField(hint: 'Enter Email'),
              const SizedBox(height: 16),
              const InputField(hint: 'Password', obscureText: true),
              const SizedBox(height: 24),
              GreenButton(text: trl('register.headline')),
              const SizedBox(height: 16),
              const DividerWithText(),
              const SizedBox(height: 16),
              const LoginIcons(),
              const SizedBox(height: 16),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: trl('register.have_account'), // Übersetzung von "Do you have an account?"
                    style: const TextStyle(color: AppColors.textSecondary),
                    children: [
                      TextSpan(
                        text: trl('register.sign_in'), // Übersetzung des "Sign In" Links
                        style: const TextStyle(color: AppColors.linkBlue),
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
