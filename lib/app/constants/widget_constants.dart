import 'package:flutter/material.dart';
import 'package:jdlcommunity_getx/app/modules/abstract/controller_abstract.dart';

abstract class WidgetConstant{
  static const  spacingBottomX1 = SizedBox(height: 10,); 
  static const  spacingBottomX2 = SizedBox(height: 20,); 
  static const  spacingBottomX3 = SizedBox(height: 20,); 

  static const edgeInsetForm = EdgeInsets.only(left: 40,right: 40,bottom: 20);
  static const edgeInsetForm05 = EdgeInsets.only(left: 40,right: 40,bottom: 10);
  
  static IconButton eyePassword(IconData icon, GetxControllerAbstract controller, value) {
    return IconButton(
        onPressed: () => controller.toggleEye(value), icon: Icon(icon));
  }

  static SnackBar basicSnackBar(text){
      return SnackBar(content: Text(text), backgroundColor: Colors.black,);
  }
}