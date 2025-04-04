import 'package:flutter/material.dart';
import 'package:flutter_responsive_app/model/place.dart';
import 'package:flutter_responsive_app/widgets/place_detail_widget.dart';

class DetailsPage extends StatelessWidget {
  final Place place;
  const DetailsPage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.subtitle), centerTitle: true),
      body: PlaceDetailWidget(place: place),
    );
  }
}
