import 'package:flutter/material.dart';

class MediaCard extends StatelessWidget {
  final String poster;
  final String title;
  final int releaseYear;
  final int? seasons;
  final int subtitleCount;

  const MediaCard({
    super.key,
    required this.poster,
    required this.title,
    required this.releaseYear,
    this.seasons,
    required this.subtitleCount,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),

      child: Stack(
        fit: StackFit.expand,
        children: [
          // Poster
          AspectRatio(
            aspectRatio: 2 / 3,
            child: Image.network(poster, fit: BoxFit.cover),
          ),

          // Gradient overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black45, Colors.black],
                  stops: const [.4, .75, 1],
                ),
              ),
            ),
          ),

          // Content
          Positioned(
            left: 12,
            right: 12,
            bottom: 12,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,

              children: [
                // Title
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,

                  children: [
                    MetadataItem(
                      icon: Icons.calendar_month,
                      text: '$releaseYear',
                    ),

                    if (seasons != null)
                      MetadataItem(icon: Icons.tv, text: 'Season $seasons'),

                    MetadataItem(icon: Icons.subtitles, text: '$subtitleCount'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MetadataItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const MetadataItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),

      decoration: BoxDecoration(
        color: Colors.white24,

        borderRadius: BorderRadius.circular(30),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(icon, size: 14, color: Colors.white),

          const SizedBox(width: 6),

          Text(text, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
