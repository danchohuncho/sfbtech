import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../navigation/main_tabs_view_model.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainTabsViewModel>();
    final currentIndex = context.select(
      (MainTabsViewModel vm) => vm.currentTabIndex,
    );
    final theme = Theme.of(context).bottomNavigationBarTheme;
    final buttons = [
      _BottomNavigationBarItemFactory(Icons.search, 'Обои'),
      _BottomNavigationBarItemFactory(Icons.waves, 'Live'),
    ]
        .asMap()
        .map((index, value) {
          return MapEntry(index, value.build(index, currentIndex, theme));
        })
        .values
        .toList();
    return BottomNavigationBar(
      selectedItemColor: const Color(0xFF171717),
      currentIndex: currentIndex,
      onTap: model.setCurrentTabIndex,
      items: buttons,
    );
  }
}

class _BottomNavigationBarItemFactory {
  var iconName;
  final String label;

  _BottomNavigationBarItemFactory(this.iconName, this.label);

  BottomNavigationBarItem build(
    int index,
    int currentIndex,
    BottomNavigationBarThemeData theme,
  ) {
    const selectedColor = Color(0xFF171717);
    const unselectedColor = Color(0xFFA09F9F);
    final color = index == currentIndex ? selectedColor : unselectedColor;
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(
        iconName,
        color: color,
      ),
      // tooltip: tooltip
    );
  }
}
