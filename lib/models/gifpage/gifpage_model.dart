import 'package:flutter/material.dart';

enum GifpageModelStatus {
  Ended,
  Loading,
  Error,
}

class GifpageModel extends ChangeNotifier {
  GifpageModelStatus _status;
  String _errorCode;
  String _errorMessage;

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  GifpageModelStatus get status => _status;

  GifpageModel();

  GifpageModel.instance() {
    //TODO Add code here
  }
  
  void getter() {
    _status = GifpageModelStatus.Loading;
    notifyListeners();

    //TODO Add code here

    _status = GifpageModelStatus.Ended;
    notifyListeners();
  }

  void setter() {
    _status = GifpageModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = GifpageModelStatus.Ended;
    notifyListeners();
  }

  void update() {
    _status = GifpageModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = GifpageModelStatus.Ended;
    notifyListeners();
  }

  void remove() {
    _status = GifpageModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = GifpageModelStatus.Ended;
    notifyListeners();
  }
}