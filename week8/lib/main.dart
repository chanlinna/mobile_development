import 'package:flutter/material.dart';
import 'package:week8/EXERCISE-4/data/joke_data.dart';
import 'package:week8/EXERCISE-4/ui/screen/jokes.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: JokeApp(jokes: jokes)
  ));
}