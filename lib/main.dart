import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.red[700],
      appBar: AppBar(
        centerTitle: true,
        title:Text('Dice Game'),
        backgroundColor: Colors.red[900],
      ),
      body: ImagePage(),
    ),
  ));
}

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftImageNumber = Random().nextInt(6) + 1;
  int rightImageNumber = Random().nextInt(6) + 1;

  randomNumber() {
    leftImageNumber = Random().nextInt(6) + 1;
    rightImageNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
          Text(
          leftImageNumber == rightImageNumber
              ? 'مبروك , لقد نجحت'
              : 'حاول مرة, اخرى',
          style: TextStyle(
            fontSize: 42.0,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    //mouseCursor: MaterialStateProperty,
                  ),
                  child: Image.asset(
                    'images/dice$leftImageNumber.png',
                  ),
                  onPressed: () {
                    setState(() {
                      randomNumber();
                    });
                  },
                ),
              ),
                 Expanded(
                child: TextButton(
                  style: ButtonStyle(
                  ),
                  child: Image.asset(
                    'images/dice$rightImageNumber.png',
                  ),
                  onPressed: () {
                    setState(() {
                      randomNumber();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
