import 'package:flutter/material.dart';
import 'package:flutter_food_app/Network%20Call.dart';

import 'OrderPage.dart';

class displaydetails extends StatelessWidget {
  const displaydetails({Key key, this.tooders}) : super(key: key);
  final Orders tooders;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Details_Push;
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Container(
                  color: Colors.deepPurple,
                ),
              ),
              SafeArea(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(8, 50, 8, 8),
                child: Column(
                  children: [
                    Center(
                      child: ClipOval(
                        child: Image.network(
                          args.cake_image,
                          width: 250,
                          height: 250,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${args.cake_name}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text(
                                "\$${args.cake_price}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                    color: Colors.amber[600]),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              pills(
                                icon: Icons.alarm,
                                data: "30 m",
                              ),
                              pills(
                                icon: Icons.star_border_outlined,
                                data: "${args.cake_rating}",
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                            child: Text(
                              "About",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Text(
                            "${args.cake_description}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          Center(
                            child: MaterialButton(
                              minWidth: double.infinity,
                              elevation: 10,
                              padding: EdgeInsets.all(20),
                              onPressed: () {
                                if (!tooders.order
                                    .containsKey(args.cake_name)) {
                                  tooders.No_of_items++;
                                  Map<String, dynamic> addcake = Map();
                                  addcake["count"] = 1;
                                  addcake["price"] = args.cake_price;
                                  addcake["display_image"]=args.cake_image;
                                  tooders.order[args.cake_name]=addcake;
                                  tooders.Total_amount+=addcake["price"];
                                }
                                for (var x in tooders.order.keys) {
                                  print(tooders.order[x]["price"]);
                                }
                              },
                              child: Text(
                                "Add to cart",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              color: Colors.deepPurple,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class pills extends StatelessWidget {
  const pills({Key key, this.icon, this.data}) : super(key: key);
  final icon;
  final data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "$data",
                style: TextStyle(fontSize: 14, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
