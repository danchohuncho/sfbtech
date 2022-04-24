import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
import '../../data/apiKey.dart';
import '../../model/video_file_model.dart';
import '../../model/wallpaper_model.dart';
import '../navigation/main_tabs_view_model.dart';
import '../widgets/search/search_field_widget.dart';
import '../widgets/wallpapers_list_widget.dart';

class MainScreenWallpapers extends StatefulWidget {
  const MainScreenWallpapers({Key? key}) : super(key: key);

  @override
  State<MainScreenWallpapers> createState() => _MainScreenWallpapersState();
}

class _MainScreenWallpapersState extends State<MainScreenWallpapers> {
  List<WallpaperModel> wallpapers = [];

  //List<VideoModel> lifeWallpapers = [];

  TextEditingController searchController = TextEditingController();

  getTrendingWallpapers() async {
    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=30&page=1"),
        headers: {"Authorization": apiKey});
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getTrendingWallpapers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final currentIndex = context.select(
      (MainTabsViewModel vm) => vm.currentTabIndex,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF171717),
        title: const Text("Обои"),
      ),
      body: IndexedStack(
        sizing: StackFit.passthrough,
        index: currentIndex,
        children: [
          Column(
            children: [
              SearchFieldWidget(searchController: searchController),
              Expanded(
                child: SingleChildScrollView(
                  child: wallpapersListWidget(
                      wallpapers: wallpapers, context: context),
                ),
              ),
            ],
          ),
        ],
      ),
      //bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
