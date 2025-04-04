import 'package:flutter/material.dart';
import 'package:flutter_responsive_app/widgets/drawer_widget.dart';
import 'package:flutter_responsive_app/widgets/place_gallery_widget.dart';
import 'package:flutter_responsive_app/widgets/responsive_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
  return Container(
    color: Colors.orange,
    child: const Center(child: Text('Desktop View')),
  );
}
