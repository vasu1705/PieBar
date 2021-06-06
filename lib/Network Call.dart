import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'dart:ui';
Future call () async{
  var uri=Uri.parse("https://41d6a7aa1af0.ngrok.io/cakesdata/all");
  var response= await http.get(uri);

  print("Response Status ${response.statusCode}");
  var obj=jsonDecode(response.body);
  print(obj.length);
  return obj;
}

class apps extends StatelessWidget  {
  const apps({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Center(child: showData()),
      ),
    );
  }
}
class showData extends StatefulWidget {
  const showData({Key key}) : super(key: key);

  @override
  _showDataState createState() => _showDataState();
}

class _showDataState extends State<showData> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: call(),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.active && snapshot.hasError) {
                return  Text('${snapshot.error}');
          }
          else if(snapshot.data==null){
            return Center(child: CircularProgressIndicator());
          }
          else{
            List<Widget> list=[];

            print(snapshot.data.length);
            for(var j=0;j<5;j++){
              for (var i = 0; i < (snapshot.data.length); i+=2) {
                list.add(
                    showgrid(
                        cake1: Cake_Info.fromJson(snapshot.data[i]["fields"]),
                        cake2: Cake_Info.fromJson(snapshot.data[i+1]["fields"]))
                );
              }
            }
            print(list.length);
            return ListView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (BuildContext ctx,int index){
                return list[index];
              },
            );
          }
        }
    );
  }
}

class showgrid extends StatelessWidget {
  const showgrid({Key key, this.cake1, this.cake2}) : super(key: key);
  final Cake_Info cake1;
  final Cake_Info cake2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          productShow(cake: cake1),
          productShow(cake: cake2),
        ],
      ),
    );
  }
}


class Cake_Info{
  final String Cake_Name,Cake_Ingredients,Cake_Description , Cake_Disp_Img,Cake_Photos;
  final int Cake_Orders,Cake_Ratings, Cake_Price;

  Cake_Info({this.Cake_Ingredients,
    this.Cake_Name,
    this.Cake_Description,
    this.Cake_Disp_Img,
    this.Cake_Orders,
    this.Cake_Photos,
    this.Cake_Price,
    this.Cake_Ratings});

  Cake_Info.fromJson(Map<String,dynamic> json):
      Cake_Name=json["Cake_Name"],
      Cake_Photos=json["Cake_Photos"],
      Cake_Disp_Img=json["Cake_Disp_Img"],
      Cake_Ratings=json["Cake_Ratings"],
      Cake_Orders=json["Cake_Orders"],
      Cake_Price=json["Cake_Price"],
    Cake_Ingredients=json["Cake_Ingredients"],
    Cake_Description=json["Cake_Description"];
}

class Details_Push{
  final String cake_description, cake_image, cake_name ;
  final int cake_rating,cake_price;
  Details_Push(this.cake_price,this.cake_name,this.cake_description,this.cake_image,this.cake_rating);
}

class productShow extends StatelessWidget {
  const productShow({Key key, @required this.cake}) : super(key: key);
  final Cake_Info cake;

  @override
  Widget build(BuildContext context) {
    var _isFav=0;
    var  ic=Icons.favorite_border_sharp;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),

      padding: EdgeInsets.fromLTRB(16, 0, 8, 8),
      child: Stack(
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context,'/details',arguments:
                  Details_Push(cake.Cake_Price,cake.Cake_Name,cake.Cake_Description,cake.Cake_Disp_Img,cake.Cake_Ratings)
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  // child: Image.asset(
                  //   "Images/cake_2.jpg",
                  //   width: 150,
                  // ),
                  child: Image.network("${cake.Cake_Disp_Img}",width: 150,height: 160,),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      child: Text(
                        cake.Cake_Name,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                      ),
                    ),
                    Text(
                      "\$${cake.Cake_Price}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: -2,
              right: -25,
              child: MaterialButton(
                height: 15,
                elevation: 5,
                onPressed: () {

                },
                color: Colors.grey[100],
                child: Icon(
                  ic,
                  color: Colors.redAccent,
                  size: 25,
                ),
                shape: CircleBorder(),
              )),
          Positioned(
            right: -25,
            bottom: 70,
            child: Row(
              children: [
                MaterialButton(
                  elevation: 5,
                  onPressed: () {Navigator.pushNamed(context,'/details',arguments:
                  Details_Push(cake.Cake_Price,cake.Cake_Name,cake.Cake_Description,cake.Cake_Disp_Img,cake.Cake_Ratings));},
                  color: Colors.deepPurple,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 25,
                  ),
                  shape: CircleBorder(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

