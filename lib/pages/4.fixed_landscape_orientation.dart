import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'last_page.dart';


class FixedOrientation2 extends StatefulWidget {
  const FixedOrientation2({Key? key}) : super(key: key);
  static const String id = '/fixed_orientation2_page';

  @override
  _FixedOrientation2State createState() => _FixedOrientation2State();
}

class _FixedOrientation2State extends State<FixedOrientation2> {
  void openLastPage()async {
    Navigator.of(context).pushNamed(LastPage.id).then((value) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    });
  }
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fixed Landscape Mode', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
        onPressed: openLastPage,
      ),
    );
  }
}
