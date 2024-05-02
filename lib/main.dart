// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          backgroundColor: Colors.indigo[800],
          title: const Text(
            "Image match",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ImagePage(),
      ),
    );
  }
}

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int LeftImageNumber = 1;
  int RightImageNumber = 2;

  void changeImage() {
    LeftImageNumber = Random().nextInt(8) + 1;
    RightImageNumber = Random().nextInt(8) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          LeftImageNumber == RightImageNumber
              ? "Congrats you win"
              : "Try Again",
          style: TextStyle(color: Colors.white, fontSize: 42.0),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeImage();
                    });
                  },
                  child: Image.asset('images/image-$LeftImageNumber.png'),
                ),
              ),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          changeImage();
                        });
                      },
                      child: Image.asset('images/image-$RightImageNumber.png')))
            ],
          ),
        )
      ],
    );
  }
}
