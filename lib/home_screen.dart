import 'package:final_project/Height_Widget.dart';
import 'package:flutter/material.dart';
import 'gender_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _gender = 0;
  int _height = 150;

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
                    GenderWidget(
                      onChange: (genderValue){
                        _gender = genderValue;
                      },
                    ),
                    HeightWidget(
                      onChange: (heightValue) {
                        _height = heightValue;
                    },)
                  ],
                ),
              ),
            ),
          ),
     );
   }
 }
