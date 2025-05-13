import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;
  final String? title;

  const CustomAppBar({
    super.key,
    this.isHome = false,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Icon
          SvgPicture.asset(
            'assets/icons/search.svg',
            height: 24,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),

          // Center: Logo or Title
          isHome
              ? SvgPicture.asset(
                  'assets/logos/logo_spotify.svg',
                  height: 34,
                  colorFilter:
                      const ColorFilter.mode(Color(0xFF1ED760), BlendMode.srcIn),
                )
              : Text(
                  title ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

          // Right Icon
          Image.asset(
            'assets/icons/menu.png',
            height: 32,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
