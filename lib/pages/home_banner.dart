import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerWidget extends StatelessWidget{

  //图片路径
  List<String> banners = <String>[
    'assets/images/banners/1.jpg',
    'assets/images/banners/2.jpg',
    'assets/images/banners/3.jpg',

  ];

  @override
  Widget build(BuildContext context)
  {
    //获取当前设备的长度 按比例算长宽
    double width  = MediaQuery.of(context).size.width;
    double height = width * 540 / 1080.0;
    return Container(
      width: width,
      height: height,
      //轮播组件
      child: Swiper(
        itemBuilder: (BuildContext context, index){
          return Container(
            //图片左右内边距离
            margin: EdgeInsets.only(left: 5,right: 5),
            child: Image.asset(
              banners[index],
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          );
        },
        //轮播数量
        itemCount: banners.length,
        //方向
        scrollDirection: Axis.horizontal,
        //自动播放
        autoplay: true,
      ),
    );
  }
}

