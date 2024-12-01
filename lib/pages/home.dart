// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:fitness_app/models/category_model.dart';
import 'package:fitness_app/models/diet_model.dart';
import 'package:fitness_app/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<DietModel> diet = [];
  List<PopularModel> popular = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getDiet() {
    diet = DietModel.getData();
  }

  void _getPopular() {
    popular = PopularModel.getData();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    _getDiet();
    _getPopular();
    return Scaffold(
        appBar: appbar(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            _searchfield(),
            SizedBox(
              height: 40,
            ), // empty space between searchfield and column below
            _categorySection(),
            // Empty space between categorysection and recommended section
            SizedBox(
              height: 40,
            ),
            _recommendationSection(),
            SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Popular',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18)),
                ),
                SizedBox(height: 15),
                ListView.separated(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  shrinkWrap:
                      true, // have to specify this to avoid the widget from filling up the entire scrollable space because it is nested under another scrollable widget
                  separatorBuilder: (context, index) => SizedBox(height: 20),
                  itemCount: popular.length,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 115,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff1D1617).withOpacity(0.07),
                                offset: Offset(0, 10),
                                blurRadius: 40,
                                spreadRadius: 0)
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: SvgPicture.asset(popular[index].iconPath,
                                  width: 55, height: 55),
                            ),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(popular[index].name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                                Text(
                                  '${popular[index].level} \n${popular[index].calories}',
                                  style: TextStyle(color: Colors.black54),
                                )
                              ],
                            )
                          ],
                        ));
                  },
                )
              ],
            )
          ],
        ));
  }

  Column _recommendationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Recommendation\nfor Diet',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 15),
        Container(
            // main continer
            height: 240,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20, right: 20),
                itemBuilder: (context, index) {
                  return Container(
                      // creates two containers
                      width: 210,
                      decoration: BoxDecoration(
                          color: diet[index].boxColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(diet[index]
                              .iconPath), // icons in the recommendation section
                          Column(
                            children: [
                              Text(
                                diet[index].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                              Text(
                                '${diet[index].level}\n${diet[index].calories}',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 45,
                            width: 130,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  diet[index].viewIsSelected
                                      ? Color(0xff9DCEFF)
                                      : Colors.transparent,
                                  diet[index].viewIsSelected
                                      ? Color(0xff92A3FD)
                                      : Colors.transparent
                                ]),
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                'View',
                                style: TextStyle(
                                    color: diet[index].viewIsSelected
                                        ? Colors.white
                                        : Color(0xffC58BF2),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ),
                          )
                        ],
                      ));
                },
                separatorBuilder: (context, index) => SizedBox(width: 20),
                itemCount: diet.length))
      ],
    );
  }

  Column _categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Category',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: 120,
          child: ListView.separated(
              // used Listview.separted instead of builder so that i add a space in between the itembuider
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) =>
                  SizedBox(width: 22), // space between the items
              itemBuilder: (context, index) {
                return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: SvgPicture.asset(categories[index].iconPath),
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        )
                      ],
                    ));
              }),
        )
      ],
    );
  }

  Container _searchfield() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color(0xff1D1617).withOpacity(0.11),
              blurRadius: 40,
              spreadRadius: 0.0)
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search Pancake',
            hintStyle: TextStyle(color: Color(0xffDDDADA), fontSize: 14),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(15), // resize the textfield

            prefixIcon: Icon(Icons.search),
            suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Colors.black,
                      indent: 12, // indent at top
                      endIndent: 12, // indent at bottom
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Icon(Icons.tune),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      title: Text(
        'Breakfast',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,

      // Leading button
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xffF7F8F8), borderRadius: BorderRadius.circular(8)),
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),

      // Action button
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Color(0xffF7F8F8),
                  borderRadius: BorderRadius.circular(8)),
              child: Icon(Icons.more_horiz)),
        )
      ],
    );
  }
}
