import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.yellow[300],
        appBar: AppBar(
          backgroundColor: Colors.yellow[600],
          title: Text("Match A Picture" , style: TextStyle(fontFamily: 'Short Stack',color: Colors.blue ,fontSize: 25),),
          centerTitle: true
        ),
        body: ImagePage(),
      ),
    );

  }
}

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftImageNumber =4;
  int rightImageNumber =5;

  void changeImage(){
    rightImageNumber=Random().nextInt(8) + 1;
    leftImageNumber=Random().nextInt(8) + 1;

  }


  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          leftImageNumber == rightImageNumber ? "Congratulations" : "Try Again. . ." ,
          style: TextStyle(fontFamily: 'Short Stack',fontSize: 35 , color: Colors.pink),),
        Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Row(
            children: [
              Expanded(child: FlatButton(child: Image.asset("lib/images/image-$leftImageNumber.png" , width: 150,),
                onPressed: (){
                setState(() {
                  changeImage();
                });
                },),),
              Expanded(child: FlatButton(child: Image.asset("lib/images/image-$rightImageNumber.png", width: 150),
                onPressed:(){
                setState(() {
                  changeImage();
                });
                } ,)),

            ],
          ),
        ),
      ],
    );
  }
}