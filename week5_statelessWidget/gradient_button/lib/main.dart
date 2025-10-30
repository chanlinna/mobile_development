import 'package:flutter/material.dart';

void main() {
  runApp((
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              GradinetButton(text: 'Hello 1', start: Color(0xff4E7DF5), end: Colors.red),
              GradinetButton(text: 'Hello 2', start: Color(0xff4E7DF5), end: Colors.red),
              GradinetButton(text: 'Hello 3', start: Color(0xff4E7DF5), end: Colors.red),
            ],
          )
        )
      )
    )
  )
  );
}

class GradinetButton extends StatelessWidget {
  final String text;
  final Color start;
  final Color end;
  const GradinetButton({super.key, required this.text, required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 400),
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [start, end]),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: Text(text,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white
                    ),
                  )
                ));
  }
}
