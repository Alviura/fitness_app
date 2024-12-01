import 'package:flutter/material.dart';

class PopularModel {
  String name;
  String iconPath;
  String level;
  String calories;
  Color boxColor;
  bool boxIsSelected;

  PopularModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.calories,
    required this.boxColor,
    required this.boxIsSelected,
  });

  static List<PopularModel> getData() {
    List<PopularModel> popular = [];

    popular.add(PopularModel(
        name: 'Blueberry Pancakes',
        iconPath: 'assets/icons/blueberry-pancake.svg',
        level: 'Intermediate',
        calories: "80-120 kcal per pancake",
        boxColor: Color(0xff92A3FD),
        boxIsSelected: true));

    popular.add(PopularModel(
        name: 'Orange Snacks',
        iconPath: 'assets/icons/orange-snacks.svg',
        level: 'easy',
        calories: "60-80 kcal per piece",
        boxColor: Color(0xffC58BF2),
        boxIsSelected: false));

    popular.add(PopularModel(
        name: 'Salmon Nigiri',
        iconPath: 'assets/icons/salmon-nigiri.svg',
        level: 'Intermediate',
        calories: "50-70  kcal per piece",
        boxColor: Color(0xffC58BF2),
        boxIsSelected: false));

    return popular;
  }
}
