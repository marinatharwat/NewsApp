import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/my_theme.dart';
import 'package:intl/intl.dart';

import 'Details_item.dart';
class NewsItem extends StatelessWidget {
  News news;

  NewsItem({super.key, required this.news});

  DateFormat dateFormat = DateFormat('dd-MM-yyyy (HH:mm)');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsNews(news: news)),
                  );
                },
                child: SizedBox(
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
            ),
            const SizedBox(height: 5,),
            Center(
              child: Text(
                news.author ?? "",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: MyTheme.blackColor),
              ),
            ),
            const SizedBox(height: 5,),
            Text(news.title ?? "", style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 5,),
            Text(
              news.publishedAt != null ? dateFormat.format(DateTime.parse(news.publishedAt!)) : "",
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
