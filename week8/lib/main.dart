import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp()
  )
);

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'SEASONS', 
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.black
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SeasonCard(country: 'FRANCE', curSeason: Season.winter),
                  SeasonCard(country: 'CAMBODIA', curSeason: Season.summer)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SeasonCard extends StatefulWidget{
  const SeasonCard({
    super.key,
    required this.country,
    required this.curSeason
  });

  final String country;
  final Season curSeason;

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

enum Season {
  winter(image: 'assets/winter.png'),
  spring(image: 'assets/spring.png'),
  summer(image: 'assets/summer.png'), 
  fall(image: 'assets/fall.png');

  final String image;
  const Season({required this.image});
}

class _SeasonCardState extends State<SeasonCard> {
  Season season = Season.winter;

  @override
  void initState() {
    super.initState();
    season = widget.curSeason;
  }

  void nextSeason() {
    setState(() {
      season = Season.values[(season.index + 1) % Season.values.length];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextSeason,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Image.asset(
                season.image,
                width: 200,
                height: 500,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 200,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.black),
                  right: BorderSide(color: Colors.black),
                  bottom: BorderSide(color: Colors.black),

                )
              ),
              child: Text(
                widget.country,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}