import 'package:flutter/material.dart';
import 'dart:async';
import 'home_banner.dart';

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{



  @override
  Widget build(BuildContext context) {
    //Page view
    return Scaffold(
      body: ListView(
        children: <Widget>[
          BannerWidget(),

        ],
      )
    );

  }
}
