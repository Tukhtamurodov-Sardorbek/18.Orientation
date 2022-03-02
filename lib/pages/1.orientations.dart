import 'package:flutter/material.dart';

import '2.mobile_tablet_views.dart';

class PortraitToLandscape extends StatefulWidget {
  const PortraitToLandscape({Key? key}) : super(key: key);
  static const String id = '/orientations';

  @override
  _PortraitToLandscapeState createState() => _PortraitToLandscapeState();
}

class _PortraitToLandscapeState extends State<PortraitToLandscape> {
  DateTime? lastPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MediaQuery.of(context).orientation == Orientation.landscape? 'Landscape Mode' : 'Portrait Mode', style: const TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
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
        child: OrientationBuilder(
            builder: (context, orientation) {
              return Container(
                  child: orientation == Orientation.portrait
                      ? _portrait('assets/images/img_1.png', 'assets/images/img_2.png', 'assets/images/img_3.png')
                      : _landscape('assets/images/img_1.png', 'assets/images/img_2.png', 'assets/images/img_3.png')
              );
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.black,),
        backgroundColor: Colors.amberAccent,
        splashColor: Colors.deepOrange,
        foregroundColor: Colors.black,
        onPressed: (){
          Navigator.of(context).pushNamed(ToTablet.id);
        },
      ),
    );
  }

  Widget _portrait(String img1Path, String img2Path, String img3Path){
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(img1Path), //'assets/images/img_2.png'
                        fit: BoxFit.fill,
                      )
                  ),
                ),
                Center(
                  child: OutlineButton(
                    // highlightColor: Colors.white,
                    highlightedBorderColor: Colors.white,
                    splashColor: Colors.amberAccent,
                    textColor: Colors.black,
                    child: const Text('BUTTON'),
                    onPressed: (){},
                  ),
                )
              ],
            ),
          ),
          const VerticalDivider(thickness: 5, color: Colors.amberAccent),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(img2Path),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  ),
                  const Divider(thickness: 5, color: Colors.amberAccent, indent: 0,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(img3Path),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
  Widget _landscape(String img1Path, String img2Path, String img3Path){
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(img1Path),
                        fit: BoxFit.cover,
                      )
                  ),
                ),
                Center(
                  child: OutlineButton(
                    // highlightColor: Colors.white,
                    highlightedBorderColor: Colors.white,
                    splashColor: Colors.amberAccent,
                    textColor: Colors.black,
                    child: const Text('BUTTON'),
                    onPressed: (){},
                  ),
                )
              ],
            ),
          ),
          const VerticalDivider(thickness: 5, color: Colors.amberAccent),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img2Path),
                    fit: BoxFit.cover,
                  )
              ),
            ),
          ),
          const VerticalDivider(thickness: 5, color: Colors.amberAccent),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img3Path),
                    fit: BoxFit.cover,
                  )
              ),
            ),
          ),
        ],
      ),
    );

  }
}
