import 'package:flutter/material.dart';
import 'package:orientation/pages/1.orientations.dart';
import 'package:orientation/pages/2.mobile_tablet_views.dart';
import 'package:orientation/pages/3.fixed_portrait_orientation.dart';
import 'package:orientation/pages/4.fixed_landscape_orientation.dart';
import 'package:orientation/pages/last_page.dart';

void main(){
  runApp(const EntryPoint());
}

class EntryPoint extends StatelessWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PortraitToLandscape(),
      routes: {
        PortraitToLandscape.id: (context) => const PortraitToLandscape(),
        ToTablet.id: (context) => const ToTablet(),
        FixedOrientation.id: (context) => const FixedOrientation(),
        FixedOrientation2.id: (context) => const FixedOrientation2(),
        LastPage.id: (context) => const LastPage(),
      },
    );
  }
}
