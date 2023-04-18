import 'package:flutter/material.dart';
import 'BmiPage.dart';

 class HomeScreen extends StatelessWidget {
   const HomeScreen({Key? key}) : super(key: key);

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

                  ],
                ),
              ),
            ),
          ),
       // Center(
       //   child: ElevatedButton(
       //     style: ButtonStyle(
       //       backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
       //     ),
       //     onPressed: () {
       //       Navigator.push(context,
       //       MaterialPageRoute(builder: (context)=>const BmiPage()),
       //       );
       //     },
       //     child: const Text("Next Screen",
       //     style: TextStyle(
       //       color: Colors.white
       //     ),
       //     ),),
       // ),
     );
   }
 }
