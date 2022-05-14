import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double boxWidth;
  final double boxHeight;
  
  LoadingIndicator({required this.boxWidth, required this.boxHeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: boxWidth,
      height: boxHeight,
      child: const Padding(
        padding: EdgeInsets.all(6.0),
        child: CircularProgressIndicator(
          backgroundColor: Color.fromARGB(70, 255, 255, 255),
          color: Color.fromARGB(255, 255, 255, 255),
          strokeWidth: 3,
        ),
      ),
    );
  }
}
