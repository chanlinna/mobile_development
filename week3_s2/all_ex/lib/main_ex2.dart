import 'package:flutter/material.dart';

// In this exercise, we don't use the scaffold widget because we don't need a full page structure, just simple
// layout with containers and text.
// The purpose of the Scaffold widget is to provide layout for a flutter app screen.

void main() {
  runApp(MaterialApp(
    home: Container(
      color: Colors.blue[300],
      padding: EdgeInsets.all(40),
      margin: EdgeInsets.all(50),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[600],
          borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: Text('CADT STUDENTS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              decoration: TextDecoration.none,
            )
          )
        )
      )
    ),
    ),
  );
}