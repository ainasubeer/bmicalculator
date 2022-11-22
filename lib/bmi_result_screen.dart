import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget
{
  final bool isMale;
  final double result;
  final int age;
  final String condition;

  BMIResultScreen({required this.result, required this.age, required this.isMale, required this.condition});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: false,
          toolbarHeight: 80,
          backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        /*leading: GestureDetector(
          child: Icon( Icons.arrow_back_ios, color: Colors.white,),
          onTap: () {
            Navigator.pop(context);
          } ,
        ) ,*/
        title:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Result:",
                //textDirection: TextDirection.ltr,
                //textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
             IconButton(onPressed:(){
               Navigator.pop(context);
             }, icon: Icon(Icons.arrow_back_ios),),

            ],
        ),

        /*Manual Way to create back arrow*/
        // leading: IconButton(
        //   onPressed: (){
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //   ),
        // ),

      ),

      body: Container(
      margin: const EdgeInsets.all(30.0),
      color: Color(0xFF1A1F38),
              width: 1000.0,
              height: 450.0,
              child: Center(
       child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${condition}",
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Text(
              "${result.round()}",
              style: const TextStyle(
                fontSize: 100.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            /*Text(
              "Age: $age",
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),*/
          ],
        ),
      ),
      ),
    );
  }
}
