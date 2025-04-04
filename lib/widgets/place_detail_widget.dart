import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_app/model/place.dart';

class PlaceDetailWidget extends StatelessWidget {
  final Place place;
  const PlaceDetailWidget({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    final fontSize = MediaQuery.of(context).size.width * 0.025;
    return ListView(
      children: [
        Image.asset(
          place.image,
          height: 320,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        buildTitle(fontSize),
        buildButtons(color),
        buildDescription(fontSize),
      ],
    );
  }

  Widget buildTitle(double fontSize) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  place.title,
                  minFontSize: 16,
                  maxFontSize: 32,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                  ),
                ),
                const SizedBox(height: 8.0),
                AutoSizeText(
                  place.subtitle,
                  minFontSize: 12,
                  maxFontSize: 22,
                  style: TextStyle(fontSize: fontSize, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          const SizedBox(width: 8.0),
          const AutoSizeText('41'),
        ],
      ),
    );
  }

  Widget buildButtons(Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButton(color, Icons.call, 'Call'),
        buildButton(color, Icons.near_me, 'Route'),
        buildButton(color, Icons.share, 'Share'),
      ],
    );
  }

  Widget buildButton(Color color, IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 8.0),
          Text(label, style: TextStyle(fontSize: 12, color: color)),
        ],
      ),
    );
  }

  Widget buildDescription(double fontSize) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: AutoSizeText(
        place.description,
        minFontSize: 12,
        maxFontSize: 24,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
