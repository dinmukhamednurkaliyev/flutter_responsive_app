import 'package:flutter/material.dart';
import 'package:flutter_responsive_app/model/place.dart';
import 'package:flutter_responsive_app/pages/details_page.dart';

class GridItemWidget extends StatelessWidget {
  final Place place;
  const GridItemWidget({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap:
            () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailsPage(place: place),
              ),
            ),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(place.title, style: TextStyle(fontSize: 18)),
            subtitle: Text(place.subtitle, style: TextStyle(fontSize: 16)),
          ),
          child: Ink.image(image: AssetImage(place.image), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
