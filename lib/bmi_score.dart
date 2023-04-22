import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';


class BmiScore extends StatelessWidget {

  final double bmiScore;
  final int age;
  String?  bmiStatus;
  String? bmiInterpretation;
  Color? bmiStatusColor;

  BmiScore({Key? key, required this.bmiScore, required this.age}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiResult();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Score"),
      ),
      body:  Container(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
        child: Card(
          elevation: 12,
          shape: const RoundedRectangleBorder(),
          child: Column(
          children: [
            const Text(
              "Your Score",
              style: TextStyle(fontSize: 30, color: Colors.blue),
          ),
            const  SizedBox(
                height: 10,
            ),
            PrettyGauge(
              gaugeSize: 300,
              minValue: 0,
              maxValue: 40,
              segments: [
                GaugeSegment("Underweight", 18.5, Colors.red),
                GaugeSegment("Normal", 6.4, Colors.green),
                GaugeSegment("OverWeight", 5, Colors.orange),
                GaugeSegment("Obese", 10.1, Colors.red),
              ],
              valueWidget: Text(bmiScore.toStringAsFixed(1),
              style: const TextStyle(fontSize: 40),
              ),
              currentValue: bmiScore.toDouble(),
              needleColor: Colors.blue,
            ),
            const SizedBox(height: 10,),
            Text(bmiStatus!,
              style: TextStyle(fontSize: 20, color: bmiStatusColor!),
            ),
            const SizedBox(
              height: 10
            ),
            Text(
              bmiInterpretation!,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(
                height: 10
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text("Re-calculate")),
                const SizedBox(width: 10,
                ),
                ElevatedButton(
                    onPressed: (){
                      Share.share(
                          "Your BMI is ${bmiScore.toStringAsFixed(1)} at age $age");
                    },
                    child: const Text("Share")),
              ],
            )
          ])))
    );
  }

  void setBmiResult(){
    if( bmiScore > 30) {
      bmiStatus = "Obese";
      bmiInterpretation = "Please manage diet and incorporate exercise into lifestyle";
      bmiStatusColor = Colors.red;
    } else if( bmiScore >= 25) {
      bmiStatus = "Overweight ";
      bmiInterpretation = "Consider changing diet and incorporating minor exercise into lifestyle";
      bmiStatusColor = Colors.orange;
    } else if( bmiScore >= 18.5) {
      bmiStatus = "Normal ";
      bmiInterpretation = "Continue the good work";
      bmiStatusColor = Colors.green;
    } else if( bmiScore < 18.5) {
      bmiStatus = "Underweight ";
      bmiInterpretation = "Try to increase your weight";
      bmiStatusColor = Colors.orange;
    }
  }
}
