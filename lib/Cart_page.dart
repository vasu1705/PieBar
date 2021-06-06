import 'package:flutter/material.dart';
import 'dart:math';

import 'Bottom_NavBar.dart';
import 'OrderPage.dart';

class Cart_Page extends StatelessWidget {
  const Cart_Page({Key key, this.toorder}) : super(key: key);
  final Orders toorder;

  @override
  Widget build(BuildContext context) {
    List<Widget> cartdata = [];
    for (var x in toorder.order.keys) {
      cartdata.add(showItem2(
        cake_name: x,
        cake_price: toorder.order[x]["price"],
        image_url: toorder.order[x]["display_image"],
        toorder: toorder,
      ));
      // cartdata.add(showItem(cake_name:x,cake_price: toorder.order[x]["price"],image_url: toorder.order[x]["display_image"],toorder: toorder,));
    }
    if (!cartdata.isEmpty) {
      return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 9,
                child: ListView(
                  children: cartdata,
                ),
              ),
              Expanded(flex: 1,child: buy(total: toorder.Total_amount,)),
              SizedBox(height: 10,)
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   mini: true,
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   child: Icon(Icons.arrow_back),
          // ),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add Items to Buy",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Image.asset(
                  "Images/oops.gif")
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          mini: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}

class showItem extends StatelessWidget {
  const showItem(
      {Key key, this.image_url, this.cake_name, this.cake_price, this.toorder})
      : super(key: key);
  final image_url;
  final String cake_name;
  final cake_price;
  final Orders toorder;
//
  @override
  Widget build(BuildContext context) {
    var rng = Random(2);
    int rn = rng.nextInt(4) + 1;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Container(
        height: 180,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipOval(
                    child: Image.network(
                      image_url,
                      width: 140,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          cake_name,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        ),
                        Text(
                          "\$${cake_price}",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 30, 8),
                      child: show_count(
                        col: Colors.white,
                        toorder: toorder,
                        itemname: cake_name,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class showItem2 extends StatelessWidget {
  const showItem2(
      {Key key, this.image_url, this.cake_name, this.cake_price, this.toorder})
      : super(key: key);
  final image_url;
  final String cake_name;
  final cake_price;
  final Orders toorder;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Container(
        height: 180,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipOval(
                    child: Image.network(
                      image_url,
                      width: 140,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: Container(
                            width: 150,
                            child: Text(
                              cake_name,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70),
                            ),
                          ),
                        ),
                        Text(
                          "\$${cake_price}",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 30, 8),
                      child: show_count(
                        col: Colors.white,
                        toorder: toorder,
                        itemname: cake_name,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class buy extends StatefulWidget {
  const buy({Key key,this.total}) : super(key: key);
  final total;

  @override
  _buyState createState() => _buyState();
}

class _buyState extends State<buy> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      // ignore: deprecated_member_use
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Amount ${widget.total} Rs.",style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold,),),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/userdata');
              },
              child: const Text('Place Order!', style: TextStyle(fontSize: 20)),
              color: Colors.deepPurple,
              textColor: Colors.white,
              elevation: 10,
              padding: EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    );
  }
}

class show_count extends StatefulWidget {
  const show_count({Key key, this.col, this.toorder, this.itemname})
      : super(key: key);
  final Color col;
  final itemname;
  final Orders toorder;
  @override
  _show_countState createState() => _show_countState();
}

class _show_countState extends State<show_count> {
  int _itemCount = 0;
  void add() {
    setState(() {
      widget.toorder.order[widget.itemname]["count"]++;
      widget.toorder.Total_amount +=
          widget.toorder.order[widget.itemname]["price"];
      _itemCount++;
      Navigator.pop(context);
      Navigator.pushNamed(context, "/cart");
      print(widget.toorder.Total_amount);
    });
  }

  void remove() {
    setState(() {
      widget.toorder.order[widget.itemname]["count"]--;
      widget.toorder.Total_amount -=
          widget.toorder.order[widget.itemname]["price"];
      if (_itemCount == 1) {
        widget.toorder.No_of_items--;
        widget.toorder.order.remove(widget.itemname);

      }
      Navigator.pop(context);
      Navigator.pushNamed(context, "/cart");
      _itemCount = max(0, _itemCount - 1);
      print(widget.toorder.Total_amount);
    });
  }

  @override
  Widget build(BuildContext context) {
    _itemCount = widget.toorder.order[widget.itemname]["count"];
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: Icon(
            Icons.add_circle_rounded,
            color: widget.col,
          ),
          onPressed: () {
            add();
          },
        ),
        Text(
          "$_itemCount",
          style: TextStyle(
              color: widget.col, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        IconButton(
          icon: Icon(
            Icons.remove_circle_rounded,
            color: widget.col,
          ),
          onPressed: () {
            remove();
          },
        )
      ],
    );
  }
}
