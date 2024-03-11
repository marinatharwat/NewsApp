import 'package:flutter/material.dart';
import 'package:news/Api/api_manager.dart';
import 'package:news/model/Category_model.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/my_theme.dart';

import 'new_item.dart';
class NewsWidget extends StatefulWidget {

  Source source ;
   NewsWidget({super.key, required this.source}) ;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(widget.source.id??""),

        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: MyTheme.greenColor,
              ),
            );
          } else {
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  children: [
                    const Text("Something went wrong "),
                    ElevatedButton(
                        onPressed: () {
                          ApiManager.getNewsBySourceId(widget.source.id??"");
                          setState(() {});
                        },
                        child: const Text("Try Aga in"))
                  ],
                ),
              );
            }
            if (snapshot.data?.status != 'ok') {
              Column(
                children: [
                  Text(snapshot.data?.message ?? ""),
                  ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(widget.source.id??"");
                      setState(() {});
                    },
                    child: const Text("Try Again"),
                  )
                ],
              );
            }
            var newsList = snapshot.data?.articles ?? [];
            return ListView.builder(
                itemBuilder: (context,index){
                  return  NewsItem(news:newsList[index] ,);
                },
              itemCount: newsList.length,

            );
          }
        }));
  }
}
// wwidget.source.id??""