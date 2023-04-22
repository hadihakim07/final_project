import 'package:final_project/home_screen.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightGreen,
        child: Stack(
          children: [
            Positioned.fill(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: ClipOval(
                          child: Container(
                            width: 180,
                            height: 180,
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.add_rounded,
                              color: Colors.lightGreen,
                              size: 130,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      const Text("BMI Calculator",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                          fontSize: 40,
                        fontWeight: FontWeight.bold
                      ),
                      ),

                      const SizedBox(height: 80),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                          },
                            child: const Text("Begin",
                            style: TextStyle(
                              color: Colors.lightGreen,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)
                            ),
                        ),
                        ),
                      ),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}

