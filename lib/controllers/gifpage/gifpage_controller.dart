import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:buscardor_gifs/models/gifpage/gifpage_model.dart';

class GifpageController {
  GifpageController();
  
  void getter(BuildContext context) {
    GifpageModel viewModel = Provider.of<GifpageModel>(context, listen: false);
    //TODO Add code here for getter
    viewModel.getter();
  }

  void setter(BuildContext context) {
    GifpageModel viewModel = Provider.of<GifpageModel>(context, listen: false);
    //TODO Add code here for setter
    viewModel.setter();
  }

  void update(BuildContext context) {
    GifpageModel viewModel = Provider.of<GifpageModel>(context, listen: false);
    //TODO Add code here for update
    viewModel.update();
  }

  void remove(BuildContext context) {
    GifpageModel viewModel = Provider.of<GifpageModel>(context, listen: false);
    //TODO Add code here for remove
    viewModel.remove();
  }
}