import 'package:flutter/cupertino.dart';

class SizeManager{
  static double h(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
  static double w(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
}