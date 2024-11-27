// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitness_app/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
        appBar: appbar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchfield(),
            SizedBox(
              height: 40,
            ), // empty space between searchfield and column below
            _categorySection()
          ],
        ));
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
