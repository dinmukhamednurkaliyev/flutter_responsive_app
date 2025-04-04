import 'package:flutter/material.dart';
import 'package:flutter_responsive_app/model/place.dart';

class PlaceDetailWidget extends StatelessWidget {
  final Place place;
  const PlaceDetailWidget({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return ListView(
      children: [
        Image.asset(
          place.image,
          height: 320,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        buildTitle(),
        buildButtons(color),
        buildDescription(),
      ],
    );
  }

  Widget buildTitle() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(place.title, style: TextStyle(fontSize: 24)),
                const SizedBox(height: 8.0),
                Text(
                  place.subtitle,
                  style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          const SizedBox(width: 8.0),
          const Text('41'),
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

  Widget buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Text(place.description, style: TextStyle(fontSize: 16)),
    );
  }
}
