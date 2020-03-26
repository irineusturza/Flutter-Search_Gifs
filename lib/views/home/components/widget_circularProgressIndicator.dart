
import 'package:flutter/material.dart';

Widget widget_circularProgressIndicator(BuildContext context) {
  return Container(
    width: 200.0,
    height: 200.0,
    alignment: Alignment.center,
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      strokeWidth: 5.0,
    ),
  );
}
