import 'package:buscardor_gifs/controllers/home/home_controller.dart';
import 'package:buscardor_gifs/views/home/home_view.dart';
import 'package:flutter/material.dart';

Widget widgetTextField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: "search here..",
        labelStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
        )
      ),
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
      textAlign: TextAlign.center,
      onSubmitted: (text) async {
        HomeController.search = text;
        HomeController.offset = 0;
        HomeView.of(context).setState((){});
      },
    );
  }