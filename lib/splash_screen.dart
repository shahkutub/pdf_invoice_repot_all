import 'dart:async';

import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 3),
    //         ()=>Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder:
    //             (context) =>
    //             SecondScreen()
    //         )
    //     )
    // );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height:MediaQuery.of(context).size.height ,
        child:Column(
          children: [
            Container(
              height: 250.0,
              decoration: new BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        300, 400.0)),
              ),
              child: Stack(
               // alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                    top: 80.0,
                    left:50,
                    child: Container(
                      height: 50,
                     width: 50,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          shape: BoxShape.circle
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60.0,
                    right:50,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          shape: BoxShape.circle
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
    );
  }
}
class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int pageIndex=0;
  String selectedString = 'Find your bill information easily';
  List<String> titles = ['Find your bill information easily','Find & Pay Bill Quickly & Safely',
    'Contact With Your Customer as You Need',];

  List<Widget> _demo=[
    Container(height: 300,color: Colors.amber),
    Container(height: 300,color: Colors.blue),
    Container(height: 300,color: Colors.green),
  ];

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void onAddButtonTapped(int index) {

    // use this to animate to the page
    //pageController.animateToPage(index);

    // or this to jump to it without animating
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              height: height/2,
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 0),
              child:  Column(
                children: [
                  Container(
                    height: height/2,
                    width: double.infinity,
                    child: PageView(
                      controller: pageController,
                      children: _demo,
                      onPageChanged: (index){
                        setState(() {
                          pageIndex=index;
                          selectedString = titles[index];
                        });
                      },
                    ),
                  ),

                ],
              )

            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              height: height/2,
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('$selectedString',style: TextStyle(fontSize: 20,color: Colors.white),),
                  Text('Next',style: TextStyle(fontSize: 10,color: Colors.white),),
                  SizedBox(height: 40,),
                  CarouselIndicator(
                    count: _demo.length,
                    index: pageIndex,
                  ),
                  SizedBox(height: 40,),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          pageIndex = pageIndex+1;
                          if(pageIndex == 3){
                            print('go to next page');
                            pageIndex = 0;
                          }
                        });

                      },
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                          padding: EdgeInsets.all(13)
                      ),
                      child: Container(
                          child: Text('Next'),
                        width: 200,
                        alignment: Alignment.center,
                      )
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        backgroundColor: Colors.purple,
                        padding: EdgeInsets.all(13)
                      ),
                      child: Container(
                        child: Text('Skip'),
                        width: 200,
                        alignment: Alignment.center,
                      )
                  ),
                ],
              ),

            ),
          )
        ],
      )
    );
  }
}