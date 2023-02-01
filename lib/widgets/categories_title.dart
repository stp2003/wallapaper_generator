import 'package:flutter/material.dart';

class CategoriesTile extends StatelessWidget {
  const CategoriesTile({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  //**
  final String imageUrl, title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(9.0),
            child: Image.network(
              imageUrl,
              height: 50.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 50.0,
            width: 100.0,
            color: Colors.black26,
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'poppins_bold',
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
