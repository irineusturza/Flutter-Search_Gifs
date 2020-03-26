import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
// import model
import 'package:buscardor_gifs/models/home/home_model.dart';

class HomeController {

  static String search;
  static int offset = 9;

  void getter(BuildContext context) {
    HomeModel viewModel = Provider.of<HomeModel>(context, listen: false);
    //TODO Add code here for getter
    
    viewModel.getter();
  }

  void setter(BuildContext context) {
    HomeModel viewModel = Provider.of<HomeModel>(context, listen: false);
    //TODO Add code here for setter
    viewModel.setter();
  }

  void update(BuildContext context) {
    HomeModel viewModel = Provider.of<HomeModel>(context, listen: false);
    //TODO Add code here for update
    viewModel.update();
  }

  void remove(BuildContext context) {
    HomeModel viewModel = Provider.of<HomeModel>(context, listen: false);
    //TODO Add code here for remove
    viewModel.remove();
  }

  Future<Map> getGifs() async {

    http.Response response;

    if(search == null || search.isEmpty){
      response = await http.get("https://api.giphy.com/v1/gifs/trending?api_key=5Lh5dCBPwth2oT9oyrZmFtU2GHBoaMaL&limit=10&rating=G");
    }else{
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=5Lh5dCBPwth2oT9oyrZmFtU2GHBoaMaL&q=$search&limit=9&offset=${offset.toString()}&rating=G&lang=en");
    }

    return json.decode(response.body);

  }


}