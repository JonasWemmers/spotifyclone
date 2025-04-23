// lib/widgets/widgets.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/core/constants/constants.dart';

class InputField extends StatelessWidget {
  final String hint;
  final bool obscureText;

  const InputField({super.key, 
    required this.hint,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textPlaceholder),
        filled: true,
        fillColor: AppColors.inputFieldBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        suffixIcon: obscureText
            ? const Icon(Icons.visibility_off, color: AppColors.iconInactive)
            : null,
      ),
    );
  }
}

class GreenButton extends StatelessWidget {
  final String text;
  const GreenButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class DividerWithText extends StatelessWidget {
  const DividerWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(color: AppColors.borderColor)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('Or', style: TextStyle(color: AppColors.textSecondary)),
        ),
        Expanded(child: Divider(color: AppColors.borderColor)),
      ],
    );
  }
}

class LoginIcons extends StatelessWidget {
  const LoginIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/logos/google_logo.svg', width: 32, height: 32),
        const SizedBox(width: 32),
        SvgPicture.asset('assets/logos/apple_logo.svg', width: 32, height: 32),
      ],
    );
  }
}
