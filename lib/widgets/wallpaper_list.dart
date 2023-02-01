import 'package:flutter/material.dart';

import '../models/photos_model.dart';

Widget wallPaperList(List<PhotosModel> listPhotos, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      // physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: listPhotos.map(
        (wallpaper) {
          return GridTile(
            child: Container(
              child: Image.network(wallpaper.src.portrait),
            ),

            // child: GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => ImageView(
            //                   imgPath: photoModel.src.portrait,
            //                 )));
            //   },
            //   child: Hero(
            //     tag: photoModel.src.portrait,
            //     child: Container(
            //       child: ClipRRect(
            //           borderRadius: BorderRadius.circular(16),
            //           child: kIsWeb
            //               ? Image.network(
            //                   photoModel.src.portrait,
            //                   height: 50,
            //                   width: 100,
            //                   fit: BoxFit.cover,
            //                 )
            //               : CachedNetworkImage(
            //                   imageUrl: photoModel.src.portrait,
            //                   placeholder: (context, url) => Container(
            //                         color: const Color(0xfff5f8fd),
            //                       ),
            //                   fit: BoxFit.cover)),
            //     ),
            //   ),
            // ),
          );
        },
      ).toList(),
    ),
  );
}
