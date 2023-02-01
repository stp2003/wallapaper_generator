import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallapaper_generator/models/photos_model.dart';
import 'package:wallapaper_generator/widgets/widgets.dart';

import '../data/data.dart';
import '../models/category_models.dart';
import '../widgets/categories_title.dart';
import '../widgets/wallpaper_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];

  List<PhotosModel> wallpapers = [];

  // get trending wall papers ->
  getTrendingWallpaper() async {
    var response = await http.get(
      Uri.parse(
        'https://api.pexels.com/v1/curated?per_page=15&page=1',
      ),
      headers: {
        'Authorization': apiKEY,
      },
    );

    // print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      PhotosModel photosModel = PhotosModel(
        url: jsonData['url'],
        photographer: jsonData['photographer'],
        photographerId: jsonData['photographerId'],
        photographerUrl: jsonData['photographerUrl'],
        src: jsonData['src'],
      );

      photosModel = PhotosModel.fromMap(element);
      wallpapers.add(photosModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getTrendingWallpaper();
    categories = getCategories();
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

            //?? list view ->
            SizedBox(
              height: 80.0,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 25.2),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoriesTile(
                    title: categories[index].categoryName,
                    imageUrl: categories[index].imageUrl,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),

            //?? wallpaper list ->
            wallPaperList(wallpapers, context),
          ],
        ),
      ),
    );
  }
}
