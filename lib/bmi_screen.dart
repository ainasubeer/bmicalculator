import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import './bmi_result_screen.dart';
//import 'package:syncfusion_flutter_sliders/sliders.dart';

class BMI_Screen extends StatefulWidget {
  @override
  _BMI_ScreenState createState() => _BMI_ScreenState();
}

class _BMI_ScreenState extends State<BMI_Screen> {
  bool isMale = true;
  double height = 180.0;
  int weight = 40;
  int age = 18;
  int _bmi= 0;
  String _condition ='Select Data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1F38),
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
      ),
      body: Column(
        children: [
          /*Male or Female Section*/
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.female,
                                size: 70.0,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                "FEMALE",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ]),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                          color: !isMale ? Colors.blue : Color(0xFF1A1F38),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.male,
                                size: 70.0,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                "MALE",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ]),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                          color: isMale ? Colors.blue : Color(0XFF1A1F38),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /*Height Section*/
          Expanded(
            child: Padding(

              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  color: Color(0xff1A1F38),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'HEIGHT',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'CM',
                                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.0),
                            ),

                          ],
                        ),
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         /* Text(
                            "${height.round()}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 60.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),*/
                          const SizedBox(
                            width: 5.0,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.red[700],
                          inactiveTrackColor: Colors.red[100],
                          trackShape: RoundedRectSliderTrackShape(),
                          trackHeight: 4.0,
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                          thumbColor: Colors.redAccent,
                          overlayColor: Colors.red.withAlpha(32),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                          tickMarkShape: RoundSliderTickMarkShape(),
                          activeTickMarkColor: Colors.red[700],
                          inactiveTickMarkColor: Colors.red[100],
                          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                          valueIndicatorColor: Colors.redAccent,
                          valueIndicatorTextStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        child: Slider(
                          value: height,
                          min: 80,
                          max: 250,
                          divisions: 250-80,
                          label: '$height',
                          onChanged: (value) {
                            setState(
                                  () {
                                height = value;
                              },
                            );
                          },
                        ),
                      )
                      /*Slider(

                        value: height,
                        min:80.0,
                        max: 250.0,
                        onChanged: (value){
                          setState(() {
                            height=value;
                          });
                        },
                        divisions: 250-80,
                        label: "$height",
                        activeColor: Colors.purple,
                        inactiveColor: Colors.purpleAccent,




                        thumbColor: Color.fromARGB(255, 230, 20, 73),
                      ),*/

                      /*SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 10.0,
                          trackShape: RoundedRectSliderTrackShape(),
                          activeTrackColor: Colors.purple.shade800,
                          inactiveTrackColor: Colors.purple.shade100,
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 14.0,
                            pressedElevation: 8.0,
                          ),
                          thumbColor: Colors.pinkAccent,
                          overlayColor: Colors.pink.withOpacity(0.2),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0),
                          tickMarkShape: RoundSliderTickMarkShape(),
                          activeTickMarkColor: Colors.pinkAccent,
                          inactiveTickMarkColor: Colors.white,
                          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                          valueIndicatorColor: Colors.black,
                          valueIndicatorTextStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        child: Slider(
                          value: height,
                          min: 80.0,
                          max: 220.0,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          },
                        ),
                      )*/
                      /*SfSlider(
                        value:height,
                        min: 0.0,
                        max: 100.0,
                        interval: 20,
                        showTicks: true,
                        showLabels: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (dynamic value){
                          setState(() {
                            height= value;
                          });
                        },
                      ),*/
                      /*Slider(
                        value: height,
                        min: 80.0,
                        max: 220.0,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        },
                        activeColor: Colors.purple,
                        inactiveColor: Colors.purpleAccent,
                        thumbColor: Color.fromARGB(255, 230, 20, 73),
                      ),*/
                    ]),
              ),
            ),
          ),

          /*Weight and Age Section*/
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${weight}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Colors.transparent,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              heroTag: 'Weight-',
                              mini: true,
                              child: Image.asset(
                                "assets/minus iconwieght.png",height: 30,
                              ),
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.transparent,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              heroTag: 'Weight+',
                              mini: true,
                              child: Image.asset(
                                "assets/plus icon weight.png",height: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      color: Color(0xFF1A1F38),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 70.0,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${age}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Colors.transparent,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              heroTag: 'age-',
                              mini: true,
                              child: Image.asset(
                        "assets/minus iconwieght.png", height: 30,
                              ),
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.transparent,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              heroTag: 'age+',
                              mini: true,
                              child: Image.asset(
                                "assets/plus icon weight.png", height: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      color: Color(0xFF1A1F38),
                    ),
                  ),
                ),
              ],
            ),
          )),

          /*Calculate Button Section*/
          Container(
            width: double.infinity,
            height: 75.0,
            color: Color(0xFFF10606),
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  //18.5 - 25 Healthy 25-30 Overweight >30 Obesity
                  _bmi=(weight/((height/100)*(height/100))).round().toInt();
                  if(_bmi>=18.5 && _bmi<=25) {_condition=" Normal";}
                  else if(_bmi>25 && _bmi<=30) {_condition=" Overweight";}
                  else if(_bmi>30) {_condition=" Obesity";}
                  else  {_condition=" Underweight";}
                });
                double result = weight / pow(height / 100, 2);
                print(result.round());
                print(_condition);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMIResultScreen(
                        condition: _condition,
                        result: result,
                        age: age,
                        isMale: isMale,
                      ),
                    ));
              },
              child: const Text(
                "CALCULATE",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
