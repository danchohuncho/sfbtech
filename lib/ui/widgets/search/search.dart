import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sfbtech/ui/widgets/search/search_field_widget.dart';

import '../../../data/apiKey.dart';
import '../../../model/wallpaper_model.dart';
import '../wallpapers_list_widget.dart';

class Search extends StatefulWidget {
  final String searchQuery;

  const Search({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<WallpaperModel> wallpapers = [];

  TextEditingController searchController = TextEditingController();

  getSearchWallpapers(String query) async {
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
        headers: {"Authorization": apiKey});

    //print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      //print(element);
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpapers(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF171717),
        title: const Text("Обои"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchFieldWidget(searchController: searchController),
            wallpapersListWidget(wallpapers: wallpapers, context: context),
          ],
        ),
      ),
    );
  }
}
