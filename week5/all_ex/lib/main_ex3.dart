import 'package:flutter/material.dart';

void main() {
  runApp((
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.pink[50],
          title:const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Products',                
              style: TextStyle(
                fontSize: 24    
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProductCard(product: Product.dart),
              ProductCard(product: Product.flutter),
              ProductCard(product: Product.firebase)
            ],
          ),
        )
      )
    )
  )
  );
}

enum Product {
  dart('Dart', 'the best object language', 'assets/ex3/dart.png'),
  flutter('Flutter', 'the best mobile widest library', 'assets/ex3/flutter.png'),
  firebase('Firebase', 'the best cloud database', 'assets/ex3/firebase.png');



  final String title;
  final String description;
  final String image;

  const Product(this.title, this.description, this.image);
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin:const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.image,
              width: 60,
              height: 60,
            ),
            Text(
              product.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24
              )
            ),
            Text(
              product.description,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12
              ),
            )
          ]
        ),
      )
    );
  }
}