import 'package:flutter/material.dart';
import 'package:flutter_responsive_app/data/places.dart';
import 'package:flutter_responsive_app/model/place.dart';
import 'package:flutter_responsive_app/widgets/drawer_widget.dart';
import 'package:flutter_responsive_app/widgets/place_detail_widget.dart';
import 'package:flutter_responsive_app/widgets/place_gallery_widget.dart';
import 'package:flutter_responsive_app/widgets/responsive_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Place selectedPlace = allPlaces[0];
  void changePlace(Place place) => setState(() {
    selectedPlace = place;  
  });
  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWidget.isMobile(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Tour App - Responsive')),
      drawer: isMobile ? const Drawer(child: DrawerWidget()) : null,
      body: ResponsiveWidget(
        mobile: buildMobile(),
        tablet: buildTablet(),
        desktop: buildDesktop(),
      ),
    );
  }

  Widget buildMobile() {
    return Column(children: [Expanded(child: PlaceGalleryWidget())]);
  }

  Widget buildTablet() {
    return Row(
      children: [
        Expanded(flex: 2, child: DrawerWidget()),
        Expanded(flex: 5, child: PlaceGalleryWidget()),
      ],
    );
  }

  Widget buildDesktop() {
    return Row(
      children: [
        const Expanded(child: DrawerWidget()),
        Expanded(flex: 3, child: buildBody()),
      ],
    );
  }

  Widget buildBody() {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(child: PlaceGalleryWidget()),
          Expanded(flex: 2, child: PlaceDetailWidget(place: selectedPlace)),
        ],
      ),
    );
  }
}
