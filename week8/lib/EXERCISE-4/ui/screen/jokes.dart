import 'package:flutter/material.dart';
import 'package:week8/EXERCISE-4/model/joke.dart';
import '../theme/theme.dart';

class JokeApp extends StatefulWidget{
  final List<JokeData> jokes;

  const JokeApp({super.key, required this.jokes});

  @override
  State<JokeApp> createState() => _JokeAppState();
}

class _JokeAppState extends State<JokeApp> {
  JokeData? favJoke;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: ListView.builder(itemCount: widget.jokes.length, 
          itemBuilder: (context, index) {
            final joke = widget.jokes[index];

            return JokeCard(
              joke: joke, 
              isFav: favJoke == joke, 
              onClick: (){
                setState(() {
                  favJoke = joke;
                });
              });
          },
        )
      );
  }
  
}

class JokeCard extends StatelessWidget {
  final JokeData joke;
  final bool isFav;
  final VoidCallback onClick;

  const JokeCard({super.key, required this.joke, required this.isFav, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(
                      color: AppColors.appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description)
              ],
            ),
          ),
          IconButton(
              onPressed: onClick,
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.red : Colors.grey,
              ))
        ],
      ),
    );
  }
}
// this one use Widget _buildJoke
// import 'package:flutter/material.dart';
// import 'package:week8/EXERCISE-4/model/joke.dart';
// import '../theme/theme.dart';

// class JokeApp extends StatefulWidget{
//   final List<JokeData> jokes;

//   const JokeApp({super.key, required this.jokes});

//   @override
//   State<JokeApp> createState() => _JokeAppState();
// }

// class _JokeAppState extends State<JokeApp> {
//   JokeData? favJoke;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: AppColors.appColor,
//           title: const Text("Favorite Jokes"),
//         ),
//         body: ListView.builder(itemCount: widget.jokes.length, itemBuilder: _buildJoke)
//       );
//   }

//   Widget _buildJoke(BuildContext context, int index) {
//     final joke = widget.jokes[index];
    
//     return Container(
//       decoration: const BoxDecoration(
//         border: Border(
//           bottom: BorderSide(width: .5, color: Colors.grey),
//         ),
//       ),
//       padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//            Expanded(
//             flex: 7,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   joke.title,
//                   style: TextStyle(
//                       color: AppColors.appColor, fontWeight: FontWeight.w800),
//                 ),
//                 const SizedBox(height: 10.0),
//                 Text(joke.description)
//               ],
//             ),
//           ),
//           IconButton(
//               onPressed: (){
//                 setState(() {
//                   favJoke = joke;
//                 });
//               },
//               icon: Icon(
//                 favJoke == joke ? Icons.favorite : Icons.favorite_border,
//                 color: favJoke == joke ? Colors.red : Colors.grey,
//               ))
//         ],
//       ),
//     );
//   }
  
// }