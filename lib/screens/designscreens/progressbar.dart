import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:slider_button/slider_button.dart';

void main() => runApp(LinearProgressIndicatorApp());

class LinearProgressIndicatorApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LinearProgressIndicatorAppState();
  }
}

class LinearProgressIndicatorAppState
    extends State<LinearProgressIndicatorApp> {
  BuildContext scaffoldContext;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  double percent = 0.0;
  RangeValues values = RangeValues(1, 50);
  RangeLabels labels = RangeLabels('1', '50');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
//      appBar: AppBar(
//        title: Text("Linear Progress Bar"),
//      ),
      body: Center(

        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top:45.0),
              child: Text("Press button for Percentage",
                  style: TextStyle(fontSize: 25)),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: LinearPercentIndicator(
                percent: percent / 100,
                center: Text(
                  percent.toString() + "%",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                progressColor: Colors.blue[400],
                lineHeight: 25,
                // linearStrokeCap: LinearStrokeCap.roundAll,
                //  backgroundColor: Colors.grey[300],
                // animation: true,
                //  animationDuration: 5000,
              ),
            ),
            RaisedButton(
                child: Text('Click To Progress'),
                onPressed: () {
                  Timer timer;
                  timer = Timer.periodic(Duration(milliseconds: 500), (_) {
                    setState(() {
                      percent += 10;
                      if (percent >= 100) {
                        timer.cancel();
                        // percent=0;
                      }
                    });
                  });
                  percent = 0.0;
                  _scaffoldKey.currentState.showSnackBar((new SnackBar(
                    content: new Text('Progress is Running!'),
                    duration: Duration(seconds: 5),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Write your code to undo the change.
                      },
                    ),
                  )));
                }),
            SizedBox(height: 30),
            Text('Percent:${percent}'),

            SizedBox(height: 20),
//            Container(
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: [
//                  Icon(
//                    Icons.volume_down,
//                    size: 40,
//                  ),
//                  Expanded(
//                    child: RangeSlider(
//                      values: values,
//                      min: 1,
//                      max: 50,
//                      divisions: 50,
//                      labels: labels,
//                      activeColor: Colors.red,
//                      inactiveColor: Colors.blue,
//                      onChanged: (value) {
//                        print('Start:${value.start} && End:${value.end}');
//                        setState(() {
//                          values = value;
//                          labels = RangeLabels(value.start.toInt().toString(),
//                              value.end .toInt().toString());
//                        });
//                      },
//                    ),
//                  ),
//
//                ],
//              ),
//            ),
//            Container(
//                child:
//
//                Text('Start:${values.start} && End:${values.end}')),
            SizedBox(height: 50),
            Container(
              child: Column(
                children: [
                  CarouselSlider(
                    items: [
                      //1st Image of Slider
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/african-sunset-with-tree-in-front-artush-foto.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //2nd Image of Slider
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/african-sunset-with-tree-in-front-artush-foto.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //3rd Image of Slider
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/african-sunset-with-tree-in-front-artush-foto.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //4th Image of Slider
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/african-sunset-with-tree-in-front-artush-foto.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //5th Image of Slider
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/african-sunset-with-tree-in-front-artush-foto.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],

                    //Slider Container properties
                    options: CarouselOptions(
                      height: 180.0,
                      enlargeCenterPage: true,
                      autoPlay: true,

                      // autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 100),
                      viewportFraction: 0.8,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 120),
            Container(
              height: 40,
              child: SliderButton(
                action: () {
                  Navigator.of(context).pop();
                },
                label: Text(
                  "Slide to Back",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                ),
                icon: Icon(Icons.arrow_back),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
