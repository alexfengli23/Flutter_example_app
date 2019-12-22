
import 'package:flutter/cupertino.dart';
import 'dart:core';

//颜色转换工具
Color string2Color(String coloString)
{
  int value = 0x00000000;

  if( coloString.isNotEmpty)
    {
      if (coloString[0] == '#')
        {
          coloString = coloString.substring(1);
        }
      value = int.tryParse(coloString,radix: 16);
      if (value != null)
        {
          if (value < 0xFF000000){
            value += 0xFF000000;
          }
        }
    }
  return Color(value);
}