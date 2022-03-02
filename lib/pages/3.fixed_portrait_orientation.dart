import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '4.fixed_landscape_orientation.dart';



class FixedOrientation extends StatefulWidget {
  const FixedOrientation({Key? key}) : super(key: key);
  static const String id = '/fixed_orientation_page1';

  @override
  _FixedOrientationState createState() => _FixedOrientationState();
}

class _FixedOrientationState extends State<FixedOrientation> {
  void openNext() async{
    Navigator.of(context).pushNamed(FixedOrientation2.id).then((value) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    });
  }

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  // @override
  // dispose(){
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.landscapeRight,
  //     DeviceOrientation.landscapeLeft,
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fixed Portrait Mode', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {Navigator.pop(context);},
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/img_1.png'), //'assets/images/img_2.png'
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
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/img_2.png'),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                    ),
                    const Divider(thickness: 5, color: Colors.amberAccent, indent: 0,),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/img_2.png'),
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
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.black,),
        backgroundColor: Colors.amberAccent,
        splashColor: Colors.deepOrange,
        foregroundColor: Colors.black,
        onPressed: openNext,
      ),
    );
  }
}
