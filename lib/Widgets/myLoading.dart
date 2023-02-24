import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


Widget myLoading(){
  return LoadingAnimationWidget.twistingDots(
          leftDotColor: const Color(0xFF1A1A3F),
          rightDotColor: const Color(0xFFEA3799),
          size: 200,
        );
}