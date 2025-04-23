import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/core/constants/constants.dart';

class ChooseModeView extends StatefulWidget {
  const ChooseModeView({super.key});

  @override
  State<ChooseModeView> createState() => _ChooseModeViewState();
}

class _ChooseModeViewState extends State<ChooseModeView> {
  bool isDarkModeSelected = true;

  void _selectMode(bool isDark) {
    setState(() {
      isDarkModeSelected = isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/cover/start_screen_2.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
                  'Choose Mode',
                  style: AppTextStyles.headline,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => _selectMode(true),
                      child: _ModeButton(
                        icon: Icons.dark_mode,
                        label: 'Dark Mode',
                        isSelected: isDarkModeSelected,
                      ),
                    ),
                    const SizedBox(width: 24),
                    GestureDetector(
                      onTap: () => _selectMode(false),
                      child: _ModeButton(
                        icon: Icons.light_mode,
                        label: 'Light Mode',
                        isSelected: !isDarkModeSelected,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final selectedMode =
                          isDarkModeSelected ? 'Dark' : 'Light';
                      debugPrint('Selected Mode: $selectedMode');
                      context.go('/login-register');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                    ),
                    child: const Text(
                      'Continue',
                      style: AppTextStyles.button,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ModeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const _ModeButton({
    required this.icon,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor:
              isSelected ? AppColors.primaryGreen : AppColors.cardBackground,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppTextStyles.subtitle.copyWith(
            color: isSelected ? AppColors.primaryGreen : Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
