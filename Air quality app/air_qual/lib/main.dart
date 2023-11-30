import 'package:flutter/material.dart';
import 'package:speedometer_chart/speedometer_chart.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  var city;
  var state;
  var country;
  var temprature;
  var humidity;
  var aqIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AIR VISUAL',
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 20,
                ),
            SpeedometerChart(
              dimension: 200,
              minValue: 0,
              maxValue: 100,
              value: 75,
              minTextValue: 'Min. 0',
              maxTextValue: 'Max. 100',
              graphColor: [Colors.red, Colors.yellow, Colors.green],
              pointerColor: Colors.black,
              valueVisible: true,
              rangeVisible: true,
            )
                  displayText: 'Air Quality Index',
                  displayTextStyle: GoogleFonts.robotoMono(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    '$precaution',
                    style: GoogleFonts.teko(
                      fontSize: 35,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HEALTH RECOMMENDATIONS',
                        style: GoogleFonts.teko(
                          color: Colors.blue,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'How to protect yourself from pollution in $city ?',
                        style:
                            GoogleFonts.openSans(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      NotificationListener<OverscrollIndicatorNotification>(
                        // ignore: missing_return
                        onNotification: (overscroll) {
                          overscroll.disallowGlow();
                        },
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              HealthRecomedation(
                                healthrec:
                                    'Sensitive groups should wear a mask outside',
                                howto: 'GET A MASK',
                                image: 'assets/images/mask.png',
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              HealthRecomedation(
                                healthrec: 'Run an air purifier',
                                howto: 'GET AN AIR PURIFIER',
                                image: 'assets/images/airpurifier.png',
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
