import 'package:buscardor_gifs/controllers/home/home_controller.dart';
import 'package:buscardor_gifs/views/gifpage/gifpage_view.dart';
import 'package:buscardor_gifs/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

Widget createGifTable(BuildContext context, AsyncSnapshot snapshot){

    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0
      ),
      itemCount: HomeController.search == null ? snapshot.data["data"].length : snapshot.data["data"].length + 1,
      itemBuilder: (context, index){
        if(HomeController.search == null || index < snapshot.data["data"].length)
          return GestureDetector(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage, 
              image: snapshot.data["data"][index]["images"]["fixed_height"]["url"] != null ? snapshot.data["data"][index]["images"]["fixed_height"]["url"] : "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRtHfxyDkW6tgxitRkZLR40tN7ZhbjiIPYLpV__XQkh2bAw4LOY",
              height: 300.0,
              fit: BoxFit.cover,
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => GifpageView(snapshot.data["data"][index])));
            },
            onLongPress: (){
              Share.share(
                snapshot.data["data"][index]["images"]["fixed_height"]["url"]
              );
            },
          );
        else
          return Container(
            child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 70.0,
                  ),
                  Text(
                    "load more...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0
                    ),
                  )
                ],
              ),
              onTap: (){
                HomeController.offset+= 9;
                HomeView.of(context).setState((){});
              },
            ),
          );
      },
    );
  }