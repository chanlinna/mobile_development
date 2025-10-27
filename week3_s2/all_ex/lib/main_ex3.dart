import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: Container(
      padding: EdgeInsets.all(40),
      child: Column(
        children:[ Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.blue[100]
          ),
          child: Center(
            child: Text('OOP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                decoration: TextDecoration.none
              )
            )
          )
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.blue[300]
          ),
          child: Center(
            child: Text('DART',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                decoration: TextDecoration.none
              )
            )
          )
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(colors: [Colors.blue[300]!, Colors.blue[900]!])
          ),
          child: Center(
            child: Text('FLUTTER',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                decoration: TextDecoration.none
              )
            )
          )
        ),
        ]
      ),
    )
  ),
  );
}