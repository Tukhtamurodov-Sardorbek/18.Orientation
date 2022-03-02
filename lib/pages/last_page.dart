import 'dart:io' show Platform, exit;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '1.orientations.dart';

class LastPage extends StatefulWidget {
  const LastPage({Key? key}) : super(key: key);
  static const String id = '/last_page';

  @override
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  DateTime? lastPressed;
  bool isBack = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  _goBack(){
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => const PortraitToLandscape()
        ),
        ModalRoute.withName("/orientations")
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Back/Home', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            setState(() {
              isBack = true;
            });
            Navigator.pop(context);
            },
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          final now = DateTime.now();
          const maxDuration = Duration(seconds: 2);
          final isWarning = lastPressed == null || now.difference(lastPressed!) > maxDuration;

          if(isWarning){
            setState(() {
              lastPressed = DateTime.now();
            });

            const snackBar = SnackBar(
              content: Text('Tap twice to exit'),
              duration: maxDuration,
            );

            ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(snackBar);
            return false;
          }
          else{
            return true;
          }
        },
        child: Stack(
          children: [
            Image(image: const AssetImage('assets/images/img_1.png'), width: MediaQuery.of(context).size.width, fit: BoxFit.cover,),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlineButton(
                    // highlightColor: Colors.white,
                    highlightedBorderColor: Colors.white,
                    splashColor: Colors.amberAccent,
                    textColor: Colors.black,
                    child: const Text('GO BACK TO MAIN'),
                    onPressed: _goBack
                  ),
                  const SizedBox(height: 20),
                  OutlineButton(
                    // highlightColor: Colors.white,
                    highlightedBorderColor: Colors.white,
                    splashColor: Colors.amberAccent,
                    textColor: Colors.black,
                    child: const Text('EXIT'),
                    onPressed: (){
                      if(Platform.isAndroid) {
                        SystemNavigator.pop();
                      } else{
                        exit(0); // Not recommended for IOS
                      }
                    }
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
