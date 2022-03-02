import 'package:flutter/material.dart';

import '3.fixed_portrait_orientation.dart';

class ToTablet extends StatefulWidget {
  const ToTablet({Key? key}) : super(key: key);
  static const String id = '/transfer_ui_page';

  @override
  _ToTabletState createState() => _ToTabletState();
}

class _ToTabletState extends State<ToTablet> {
  bool isTablet = false;

  void openNext()async{
    Navigator.of(context).pushNamed(FixedOrientation.id);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if(MediaQuery.of(context).size.shortestSide > 600 && MediaQuery.of(context).orientation == Orientation.portrait) {
      setState(() {
        isTablet = true;
      });
    } else if(MediaQuery.of(context).size.shortestSide > 600 && MediaQuery.of(context).orientation == Orientation.landscape) {
      setState(() {
        isTablet = true;
      });
    }else{
      setState(() {
        isTablet = false;
      });
    }
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Future.delayed(Duration.zero).then((value) {
  //     if(MediaQuery.of(context).size.shortestSide > 600 && MediaQuery.of(context).orientation == Orientation.portrait) {
  //       setState(() {
  //         isTablet = true;
  //       });
  //     } else if(MediaQuery.of(context).size.shortestSide > 600 && MediaQuery.of(context).orientation == Orientation.landscape) {
  //       setState(() {
  //         isTablet = true;
  //       });
  //     }else{
  //       setState(() {
  //         isTablet = false;
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isTablet ? 'TABLET VIEW' : 'MOBILE VIEW', style: const TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {Navigator.pop(context);},
        ),
      ),
      body: isTablet
          ? _tablet('assets/images/img_1.png', 'assets/images/img_2.png', 'assets/images/img_3.png')
          : _mobile('assets/images/img_1.png', 'assets/images/img_2.png', 'assets/images/img_3.png'),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.black,),
        backgroundColor: Colors.amberAccent,
        splashColor: Colors.deepOrange,
        foregroundColor: Colors.black,
        onPressed: openNext,
      ),
    );
  }

  Widget _mobile(String img1Path, String img2Path, String img3Path){
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            width: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(img1Path), //'assets/images/img_2.png'
                  fit: BoxFit.fill,
                )
            ),
            child: Center(
              child: OutlineButton(
                // highlightColor: Colors.white,
                highlightedBorderColor: Colors.white,
                splashColor: Colors.amberAccent,
                textColor: Colors.black,
                child: const Text('BUTTON'),
                onPressed: (){},
              ),
            ),
          ),
          const VerticalDivider(thickness: 5, color: Colors.amberAccent),
          SizedBox(
            width: MediaQuery.of(context).size.width - 176,
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
            ),
          )
        ],
      ),
    );
  }

  Widget _tablet(String img1Path, String img2Path, String img3Path){
    return Padding(
      padding: const EdgeInsets.all(5.0),
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
                ),
              ],
            ),
          ),
          const VerticalDivider(thickness: 5, color: Colors.amberAccent),
          Expanded(
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
}
