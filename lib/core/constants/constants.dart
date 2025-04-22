import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const Color primaryGreen = Color(0xFF42C83C);
  static const Color linkBlue = Color(0xFF288CE9);

  // Background colors
  static const Color background = Color(0xFF0D0C0C);
  static const Color inputFieldBackground = Color(0xFF1A1A1A);
  static const Color cardBackground = Color(0xFF191919);

  // Text colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFA0A0A0);
  static const Color textPlaceholder = Color(0xFFA7A7A7);
  static const Color textLink = Color(0xFF288CE9);
  static const Color textHint = Color(0xFFDBDBDB);

  // Miscellaneous UI
  static const Color iconInactive = Color(0xFFA0A0A0);
  static const Color borderColor = Color(0xFF2A2A2A);
}

class AppTextStyles {
  static const String _fontFamily = 'Satoshi';

  // Buttons
  static const TextStyle button = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Headlines (e.g. Login, Register)
  static const TextStyle headline = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Subtitle under headline
  static const TextStyle subtitle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  // Clickable texts like "Login", "Register now"
  static const TextStyle link = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textLink,
  );

  // Song title
  static const TextStyle songTitle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Artist under song title
  static const TextStyle artist = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.textSecondary,
  );

  // Text input by user
  static const TextStyle inputText = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  // Placeholder in input field
  static const TextStyle inputPlaceholder = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPlaceholder,
  );

  // Lyrics or content text
  static const TextStyle lyricsText = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.white70,
  );

  // Navigation bar text
  static const TextStyle navText = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
}
