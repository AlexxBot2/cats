
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      //width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://cdn2.thecatapi.com/images/${imagePath}.jpg"),
              fit: BoxFit.cover)),
    );
  }
}