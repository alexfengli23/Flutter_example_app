import 'package:flutter/material.dart';
import 'dart:async';

class AboutUsPage extends StatefulWidget{
  @override
  AboutUsPageState createState() => AboutUsPageState();
}

class AboutUsPageState extends State<AboutUsPage>{



  @override
  Widget build(BuildContext context) {
    //Page view
    return Scaffold(
      body:Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/banners/2.jpg',fit: BoxFit.cover,),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('公司介绍'),
              onTap: (){
                Navigator.of(context).pushReplacementNamed('company_info');
              },
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('公司优势'),
              onTap: (){

              },
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('联系我们'),

            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
          ],
        ),
      )
    );

  }
}
