import 'package:flutter/material.dart';
import '../../model/wallpaper_model.dart';
import '../screens/image_view.dart';

Widget wallpapersListWidget(
    {required List<WallpaperModel> wallpapers, context}) {
  return GridView.count(
    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
    padding: const EdgeInsets.fromLTRB(6, 0, 6, 6),
    crossAxisCount: 3,
    childAspectRatio: 0.54,
    mainAxisSpacing: 6.0,
    crossAxisSpacing: 6.0,
    children: wallpapers.map((wallpaper) {
      return GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImageView(
                          imgUrl: wallpaper.src!.portrait,
                        )));
          },
          child: Hero(
            tag: wallpaper.src!.portrait,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  wallpaper.src!.tiny,
                  fit: BoxFit.cover,
                )),
          ),
        ),
      );
    }).toList(),
  );
}
