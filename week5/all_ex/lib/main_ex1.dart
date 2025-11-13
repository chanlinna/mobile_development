import 'package:flutter/material.dart';

void main() {
  runApp((
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.pink[50],
          title:const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'My Hobbies',                
              style: TextStyle(
                fontSize: 24    
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(title: "Travelling", icon: Icons.travel_explore_sharp, color: Colors.green),
              HobbyCard(title: "Skating", icon: Icons.skateboarding, color: Colors.blue)
            ]
          )
        )
      )
    )
  )
  );
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;

  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.color = Colors.blue
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Center(
        child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40
                ),
              )
            ]
        )
      )
    );
  }
}