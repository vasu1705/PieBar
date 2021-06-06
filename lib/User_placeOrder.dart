import 'package:flutter/material.dart';
import 'package:flutter_food_app/OrderPage.dart';

class user_Order extends StatelessWidget {
  const user_Order({Key key, this.tooders}) : super(key: key);
  final Orders tooders;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            "Images/grad.jpg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      "Images/cart.jpg",
                      width: 200,
                    ),
                    textbox(
                      icon1: Icons.account_circle_outlined,
                      hinttext: "Full Name ",
                    ),
                    textbox(
                      icon1: Icons.home_sharp,
                      hinttext: " Address ",
                    ),
                    textbox(
                      icon1: Icons.gps_fixed_sharp,
                      hinttext: " Pin Code ",
                    ),
                    textbox(
                      icon1: Icons.dialer_sip,
                      hinttext: " Contact Number ",
                    ),
                    Text(
                      "${tooders.Total_amount}",
                      style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Place Order",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class textbox extends StatelessWidget {
  const textbox({Key key, this.icon1, this.hinttext}) : super(key: key);
  final icon1;
  final hinttext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.blueGrey,
          color: Color.fromRGBO(224, 224, 224, 1),
          borderRadius: new BorderRadius.circular(20.0),
        ),
        child: TextField(
          cursorColor: Colors.purple,
          decoration: InputDecoration(
              focusColor: Colors.white,
              prefixIcon: Icon(
                icon1,
                size: 25,
                color: Colors.amberAccent,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: hinttext,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintStyle: TextStyle(
                  color: Colors.brown[600], fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
