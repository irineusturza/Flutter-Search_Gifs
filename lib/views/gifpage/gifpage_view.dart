import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

// import model
import 'package:buscardor_gifs/models/gifpage/gifpage_model.dart';
// import controller
import 'package:buscardor_gifs/controllers/gifpage/gifpage_controller.dart';

class GifpageView extends StatelessWidget {

  final Map _gifData;

  GifpageView(this._gifData);

  @override
  Widget build(BuildContext context) {
    GifpageController viewController = GifpageController();
    return ChangeNotifierProvider<GifpageModel>(
      create: (context) => GifpageModel.instance(),
      child: Consumer<GifpageModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(_gifData["title"]),
              backgroundColor: Colors.black,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.share, color: Colors.white,),
                  onPressed: (){
                    Share.share(
                      _gifData["images"]["fixed_height_small"]["url"]
                    );
                  }
                ),
              ],
            ),
            backgroundColor: Colors.black,
            body: Center(
              child: Image.network(_gifData["images"]["fixed_height_small"]["url"]),
            ),
          );
        },
      ),
    );
  }
}