import 'package:flutter/material.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key key,}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedindex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
      if(index==1 && ModalRoute.of(context).settings.name!="/cart"){
        Navigator.pushNamed(context, '/cart');
      }
      else if(index==0 && ModalRoute.of(context).settings.name!="/"){
          Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 5,
      fixedColor: Colors.amber,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
      ],
      currentIndex: _selectedindex,
      onTap: _onItemTapped,

    );
  }
}