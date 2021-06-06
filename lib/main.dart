import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_food_app/Bottom_NavBar.dart';
import 'package:flutter_food_app/Cart_page.dart';
import 'package:flutter_food_app/DetailsPage.dart';
import 'package:flutter_food_app/FoodItems.dart';
import 'dart:math';
import 'package:flutter_food_app/Network%20Call.dart';
import 'package:flutter_food_app/User_placeOrder.dart';

import 'OrderPage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orders toorder=Orders();
    return MaterialApp(
      title: "RoyalBakers",
      initialRoute: '/',
      routes: {
        '/':(context)=>HomePage(),
        '/cart':(context)=>Cart_Page(toorder: toorder,),
        '/details':(context)=>displaydetails(tooders: toorder,),
        '/userdata':(context)=>user_Order(tooders: toorder,)
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    var rng=Random(4);
    // for (int i = 0; i < 5; i++) {
      // items.add(showgrid(cake1: rng.nextInt(4)+1, image_2: rng.nextInt(4)+1));
    // }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(top: 30, right: 15, left: 15, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Menu",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 35)),
                  Icon(
                    Icons.supervised_user_circle_outlined,
                    size: 40,
                    color: Colors.purple[800],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.blueGrey,
                    color: Color.fromRGBO(224, 224, 224, 1),
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Search',
                        enabledBorder: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Fooditems(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Popular",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              showData(),

              // Column(
              //   children: items,
              // ),
              // showData(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}






