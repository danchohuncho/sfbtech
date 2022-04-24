import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import '../widgets/set_wallpaper_button.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;

  const ImageView({Key? key, required this.imgUrl}) : super(key: key);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var filePath;

  String home = "Home Screen",
      lock = "Lock Screen",
      both = "Both Screen",
      system = "System";

  bool downloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Hero(
              tag: widget.imgUrl,
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    widget.imgUrl,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    //_save();
                    setWallpaperOnHome();
                  },
                  child: const SetWallpaperButton(
                    title: "Главный экран",
                  ),
                ),
                const SizedBox(
                  width: 34,
                ),
                GestureDetector(
                  onTap: () {
                    //_save();
                    setWallpaperOnLock();
                  },
                  child: const SetWallpaperButton(
                    title: "Экран блокировки",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> setWallpaperOnHome() async {
    int location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imgUrl);
    await WallpaperManager.setWallpaperFromFile(file.path, location);
    Navigator.pop(context);
  }

  Future<void> setWallpaperOnLock() async {
    int location = WallpaperManager.LOCK_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imgUrl);
    await WallpaperManager.setWallpaperFromFile(file.path, location);
    Navigator.pop(context);
  }

/*  _save() async {
    await _askPermission();
    var response = await Dio()
        .get(widget.imgUrl, options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    Navigator.pop(context);
  }

  _askPermission() async {
    if (Platform.isIOS) {
      //Map<Permission, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.photos]);
      Map<Permission, PermissionStatus> permissions =
          await [Permission.photos].request();
    } else {
      PermissionStatus permission = await Permission.storage.status;
    }
  }*/
}
