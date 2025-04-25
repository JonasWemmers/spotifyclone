import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/core/constants/constants.dart';
import 'package:spotify_clone/features/auth/widgets/shared_auth_widgets.dart';
import 'package:spotify_clone/core/utils/trl.dart'; // Importiere hier trl()

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
              Center(
                child: Text(
                  trl('sign_in.headline'), // Übersetzung des Titels
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
                    text: trl('sign_in.subtitle_1'), // Übersetzung der ersten Zeile
                    style: const TextStyle(color: AppColors.textSecondary),
                    children: [
                      TextSpan(
                        text: trl('sign_in.subtitle_2'), // Übersetzung des Links
                        style: const TextStyle(color: AppColors.linkBlue),
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
              Text(
                trl('sign_in.recovery_password'), // Übersetzung für "Recovery Password"
                style: const TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 24),
              GreenButton(text: trl('sign_in.headline'),),
              const SizedBox(height: 16),
              const DividerWithText(),
              const SizedBox(height: 16),
              const LoginIcons(),
              const SizedBox(height: 16),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: trl('sign_in.not_a_member'), // Übersetzung von "Not a Member?"
                    style: const TextStyle(color: AppColors.textSecondary),
                    children: [
                      TextSpan(
                        text: trl('sign_in.register_now'), // Übersetzung des Registrierungs-Links
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
