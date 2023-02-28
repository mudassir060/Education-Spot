import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../constants/style.dart';


Widget myLoading(){
  return SizedBox(
    height: 200,
    child: Center(
      child: LoadingAnimationWidget.inkDrop(
              color: seconderyColor,
              size: 50,
            ),
    ),
  );
}