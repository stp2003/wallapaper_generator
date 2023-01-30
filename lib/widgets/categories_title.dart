import 'package:flutter/material.dart';

class CategoriesTitle extends StatelessWidget {
  const CategoriesTitle({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  //**
  final String imageUrl, title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            child: Image.network(imageUrl),
          ),
          Container(
            child: Text(
              title,
            ),
          ),
        ],
      ),
    );
  }
}
