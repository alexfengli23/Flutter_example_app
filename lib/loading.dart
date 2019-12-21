import 'package:flutter/material.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget{
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<LoadingPage>{

  @override
  void initState() {
    super.initState();

    //在加载页面停顿3秒
    Future.delayed(Duration(seconds: 3),(){
      print('Flutter 企业站 启动...');
      Navigator.of(context).pushReplacementNamed("app");
    });
  }

  @override
  Widget build(BuildContext context) {
  //Page view
    return Center(
      child: Center(
                //重叠组件
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/loading.jpeg'
            ),
            Center(
              child: Text(
                  "Flutter企业站",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 36.0,
                  decoration: TextDecoration.none
                ),
              ),
            )
          ],
        ),
      ),

    );

  }
}
