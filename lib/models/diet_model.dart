import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String meal;
  String calories;
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.meal,
    required this.calories,
    required this.boxColor,
    required this.viewIsSelected,
  });

  static List<DietModel> getData() {
    List<DietModel> diet = [];

    diet.add(DietModel(
        name: 'Honey Pancakes',
        iconPath: 'assets/icons/honey-pancakes.svg',
        level: 'Intermediate',
        meal: 'Breakfast',
        calories: "100-150 kcal per pancake",
        boxColor: Color(0xff92A3FD),
        viewIsSelected: true));

    diet.add(DietModel(
        name: 'Canai Bread',
        iconPath: 'assets/icons/canai-bread.svg',
        level: 'Intermediate',
        meal: 'Supper',
        calories: "200-300 kcal per piece",
        boxColor: Color(0xffC58BF2),
        viewIsSelected: false));

    return diet;
  }
}
