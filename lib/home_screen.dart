import 'dart:math';

import 'package:final_project/Height_Widget.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'Weight_Age_widget.dart';
import 'gender_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiTotal = 0;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: const Text("BMI Calculator"),
       ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
              child: Card(
                elevation: 12,
                shape: const RoundedRectangleBorder(),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                          "Please Enter Your information",
                            style: TextStyle(fontSize: 25,
                            color: Colors.grey,
                          )
                      ),
                    ),
                    GenderWidget(
                      onChange: (genderValue){
                        _gender = genderValue;
                      },
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AgeWeight(
                            onChange: (ageValue ) {
                              _age = ageValue;
                            },
                            title: 'Age',
                            initValue: 50,
                            max: 100,
                            min: 0),
                        AgeWeight(
                            onChange: (weightValue ) {
                              _weight = weightValue;
                            },
                            title: 'Weight(Lbs)',
                            initValue: 50,
                            max: 200,
                            min: 0)
                      ],
                    ),
                    HeightWidget(
                      onChange: (heightValue) {
                        _height = heightValue;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 60
                      ),

                        child: SwipeableButtonView(
                          isFinished: _isFinished,
                          onFinish: () {
                            setState(() {
                              _isFinished = false;
                            });
                          },
                          onWaitingProcess: () {
                            calculateBmi();

                            Future.delayed(const Duration(seconds: 2),(){
                              setState(() {
                                _isFinished = true;
                              });
                            });
                          },
                          activeColor: Colors.lightGreen,
                          buttonWidget: const Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.black,
                          ),
                          buttonText: 'Calculate'),
                      )
                  ],
                ),
              ),
            ),
          ),
     );
   }

   void calculateBmi(){
    _bmiTotal = _weight/pow(_height/100, 2);
   }
 }
