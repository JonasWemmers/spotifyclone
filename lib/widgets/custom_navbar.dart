import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/core/constants/constants.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.navBarBackground,
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: AppColors.primaryGreen,
        unselectedItemColor: AppColors.iconInactive,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _buildNavBarIcon('assets/icons/navbar_home.svg', 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildNavBarIcon('assets/icons/navbar_discovery.svg', 1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildNavBarIcon('assets/icons/navbar_heart.svg', 2),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildNavBarIcon('assets/icons/navbar_profile.svg', 3),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildNavBarIcon(String assetPath, int index) {
    final isSelected = index == currentIndex;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 3,
          width: 20,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryGreen : Colors.transparent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 12), // Abstand zwischen grünem Balken und Icon
        Padding(
          padding: const EdgeInsets.only(top: 4), // Abstand über dem Icon
          child: SvgPicture.asset(
            assetPath,
            height: 24,
            colorFilter: ColorFilter.mode(
              isSelected ? AppColors.primaryGreen : AppColors.iconInactive,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
