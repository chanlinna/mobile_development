import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ? //to hide debug banner
      home: GalleryViewer(images: images)
    ));

class GalleryViewer extends StatefulWidget{
  final List<String> images;

  const GalleryViewer({super.key, required this.images});

  @override
  State<GalleryViewer> createState() => _GalleryViewerState();
}

class _GalleryViewerState extends State<GalleryViewer>{
  int currImage = 0;

  void goToNextImage() {
    setState(() {
      currImage = (currImage + 1) % widget.images.length;
    });
  }

  void goToPreviousImage() {
    setState(() {
      currImage = (currImage - 1 + widget.images.length) % widget.images.length;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green[50],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Text('Image viewer'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.navigate_before),
              tooltip: 'Go to the previous image',
              onPressed: goToPreviousImage,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
              child: IconButton(
                icon: const Icon(Icons.navigate_next),
                tooltip: 'Go to the next image',
                onPressed: goToNextImage,
              ),
            ),
          ],
        ),
        body: Image.asset(widget.images[currImage]),
    );
  }
}
