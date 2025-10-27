import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Container(
      padding: EdgeInsets.all(40),
      child: Column(
        children:[ 
          CustomCard(text: 'OOP', startColor: Colors.blue[100]!, endColor: Colors.blue[900]!),
          CustomCard(text: 'DART', startColor: Colors.blue[300]!, endColor: Colors.blue[900]!),
          CustomCard(text: 'FLUTTER', startColor: Colors.blue[600]!, endColor: Colors.blue[900]!)
        ]
      ),
    )
  ),
  );
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color startColor;
  final Color endColor;

  const CustomCard({
    super.key,
    required this.text,
    required this.startColor,
    required this.endColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(colors: [startColor, endColor])
      ),
      child: Center(
        child: Text(text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
            decoration: TextDecoration.none
          )
        )
      )
    );
  }
}