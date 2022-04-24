import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfbtech/ui/screens/main_screen_wallpapers.dart';
import 'package:sfbtech/ui/navigation/main_tabs_view_model.dart';

class ScreenFactory {
  Widget makeWallpapersScreen() => ChangeNotifierProvider(
        create: (_) => MainTabsViewModel(),
        child: const MainScreenWallpapers(),
      );
}
