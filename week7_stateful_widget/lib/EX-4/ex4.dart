import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF9B0957),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                MyScore(course: 'Flutter'),
                MyScore(course: 'Dart'),
                MyScore(course: 'React'),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class MyScore extends StatefulWidget {
  final String course;
  const MyScore({super.key, required this.course});

  String get courseTitle => 'My score in $course';

  @override
  State<MyScore> createState() => _MyScoreState();
}

class _MyScoreState extends State<MyScore> {
  int currScore = 0;

  Color scoreBarColor() {
    if (currScore < 5) return const Color(0xFF3ACC75);
    if (currScore < 8) return const Color(0xFF00B52A);
    return const Color(0xFF006200); // 8,9,10
  }

  void changeScore(int amount) {
    setState(() {
      currScore = (currScore + amount).clamp(0, 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            widget.courseTitle,
            style: const TextStyle(
              color: Color(0xFF420832),
              fontSize: 36,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () => changeScore(-1),
                icon: const Icon(Icons.minimize, color: Color(0xFF420832), size: 30),
              ),
              IconButton(
                onPressed: () => changeScore(1),
                icon: const Icon(Icons.add, color: Color(0xFF420832), size: 30),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                      style: BorderStyle.solid, 
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: currScore / 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: scoreBarColor(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
