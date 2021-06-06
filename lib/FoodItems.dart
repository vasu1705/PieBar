import 'package:flutter/material.dart';
class Fooditems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipOval(child: Image.asset('Images/cake_5.jpg')),
                ),
                Text(
                  'Cakes',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipOval(child: Image.asset('Images/cake_3.jpg')),
                ),
                Text(
                  'Chocolate Cakes',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipOval(child: Image.asset('Images/cake_4.jpg')),
                ),
                Text(
                  'Chocolate Cakes',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                )
              ],
            ),
          ),Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipOval(child: Image.asset('Images/cake_2.jpg')),
                ),
                Text(
                  'Chocolate Cakes',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
