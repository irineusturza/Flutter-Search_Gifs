import 'package:buscardor_gifs/views/gifpage/gifpage_view.dart';
import 'package:buscardor_gifs/views/home/components/createGifTable.dart';
import 'package:buscardor_gifs/views/home/components/widget_TextField.dart';
import 'package:buscardor_gifs/views/home/components/widget_circularProgressIndicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
// import model
import 'package:buscardor_gifs/models/home/home_model.dart';
// import controller
import 'package:buscardor_gifs/controllers/home/home_controller.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeView extends StatefulWidget {

  //allow external child widget to access this class state.
  static _HomeViewState of(BuildContext context) => context.ancestorStateOfType(const TypeMatcher<_HomeViewState>());

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController viewController = HomeController();

  @override
  void initState() {
    getGifs();
    super.initState();
  }

  Future<Null> getGifs() async {
    await viewController.getGifs();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>(
      create: (context) => HomeModel.instance(),
      child: Consumer<HomeModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Image.network("https://developers.giphy.com/branch/master/static/header-logo-8974b8ae658f704a5b48a2d039b8ad93.gif"),
              centerTitle: true,
            ),
            backgroundColor: Colors.black,
            body: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: widgetTextField(context),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: viewController.getGifs(),
                    builder: (context, snapshot){
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting :
                          return widget_circularProgressIndicator(context);
                          break;
                        default:
                          if(snapshot.hasError){
                            return Container();
                          }else{
                            return createGifTable(context, snapshot);
                          }
                      }
                    }, 
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

