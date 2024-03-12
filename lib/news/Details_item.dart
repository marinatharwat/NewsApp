import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/my_theme.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

import '../provider/app_confing_provider.dart';

class DetailsNews extends StatelessWidget {

  News news;

  DetailsNews({super.key, required this.news});

  DateFormat dateFormat = DateFormat('dd-MM-yyyy (HH:mm)');
  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<AppConfigProvider>(context);

    return Scaffold(
      backgroundColor:   provider.isDarkMode()?MyTheme.blackDark:MyTheme.whiteColor,

    appBar: AppBar(
      toolbarHeight: MediaQuery.of(context).size.height /9,
        title: Text(news.author ?? "",
          style: Theme.of(context).textTheme.titleLarge,
        ),
    ),
    body:  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage ?? '',
                  width: double.infinity,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 0.3,
                  placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5,),
          Center(
            child: Text(
              news.author ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color:provider.isDarkMode()?MyTheme.whiteColor:MyTheme.blackColor),
            ),
          ),
          const SizedBox(height: 5,),
          Text(
            news.title ?? "",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color:provider.isDarkMode()?MyTheme.whiteColor:MyTheme.blackColor),
          ),
          const SizedBox(height: 5,),
          Text(
            news.publishedAt != null ? dateFormat.format(DateTime.parse(news.publishedAt!)) : "",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color:provider.isDarkMode()?MyTheme.whiteColor:MyTheme.blackColor),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 20,),
          Text(
            news.description ?? "",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color:provider.isDarkMode()?MyTheme.whiteColor:MyTheme.blackColor),
          ),
          const SizedBox(height: 50,),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () async {
            final url = news.url;
            if (url != null && await canLaunch(url)) {
              await launch(url);
            } else {
            }
          },
          child: Text(
         'View Full Article',
            style: TextStyle(
              fontSize: 14,
              color: provider.isDarkMode()?MyTheme.whiteColor:MyTheme.blackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Icon(Icons.arrow_right_sharp, size: 40, color: MyTheme.greenColor,)
      ],
    ),
        ],
      ),
    ),
    );

  }
}

void openUrl(String url) async {
  try {
    await Process.run('cmd', ['/c', 'start', url]);
  } catch (e) {
    print('Error: $e');
  }
}