import 'package:flutter/material.dart';
import 'package:wallapaper_generator/widgets/widgets.dart';

import '../models/category_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];

  @override
  void initState() {
    // categories.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appName(),
        backgroundColor: const Color.fromRGBO(16, 13, 34, 1),
        elevation: 0.0,
      ),

      //?? body ->
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(
                  30.0,
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25.0),
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'poppins',
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.pinkAccent,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
          ],
        ),
      ),
    );
  }
}
