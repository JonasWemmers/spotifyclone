import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/core/constants/constants.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Text(
                          'Happier Than Ever\nBillie Eilish',
                          style: AppTextStyles.songTitle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset(
                          'assets/cover/billi_cover_top.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Tabs
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _TabButton(text: 'News', selected: true),
                  _TabButton(text: 'Video'),
                  _TabButton(text: 'Artists'),
                  _TabButton(text: 'Podcast'),
                ],
              ),
            ),

            const SizedBox(height: 16),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
            ),
            const SizedBox(height: 16),

            // Horizontale Liste
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  _ElementCard(
                    imagePath: 'assets/cover/drake_cover.png',
                    title: 'Scorpion',
                    artist: 'Drake',
                  ),
                  _ElementCard(
                    imagePath: 'assets/cover/bili_cover.png',
                    title: 'Bad Guy',
                    artist: 'Billie Eilish',
                  ),
                  _ElementCard(
                    imagePath: 'assets/cover/bili_cover_2.png',
                    title: 'Happier Than Ever',
                    artist: 'Billie Eilish',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Playlist Überschrift
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Playlist', style: AppTextStyles.headline),
                  Text('See More', style: AppTextStyles.subtitle),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Playlist Elemente
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _PlaylistTile(
                      title: 'As It Was',
                      artist: 'Harry Styles',
                      duration: '5:33'),
                  _PlaylistTile(
                      title: 'God Did', artist: 'DJ Khaled', duration: '3:43'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String text;
  final bool selected;

  const _TabButton({required this.text, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Satoshi',
              fontSize: 16,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              color: selected ? AppColors.textPrimary : AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          if (selected)
            Container(
              height: 2,
              width: 20,
              color: AppColors.primaryGreen,
            ),
        ],
      ),
    );
  }
}

class _ElementCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String artist;

  const _ElementCard({
    required this.imagePath,
    required this.title,
    required this.artist,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 120,
                width: 120,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(title, style: AppTextStyles.songTitle),
          Text(artist, style: AppTextStyles.artist),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _PlaylistTile extends StatelessWidget {
  final String title;
  final String artist;
  final String duration;

  const _PlaylistTile({
    required this.title,
    required this.artist,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.play_circle,
              color: AppColors.iconInactive,
              size: 32,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.songTitle),
                Text(artist, style: AppTextStyles.artist),
              ],
            ),
          ),
          Text(duration, style: AppTextStyles.inputText),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/heart.svg',
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}
