// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                  color: Color(0xffF7F8F8),
                  borderRadius: BorderRadius.circular(8)),
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
        ),
        body: Column(
          children: [
            Container(
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
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(15), // resize the textfield
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.filter_list),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
              ),
            ),
          ],
        ));
  }
}
