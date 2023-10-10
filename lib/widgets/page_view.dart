import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inshort/pages/transition_page.dart';

import '../data_models/news_model.dart';
import '../dio/get_data.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({super.key});

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  NewsModel? newsModel;
  Response? result;
  bool isLoading = false;

  getNameData() async {
    result = await getData();
    if (result?.statusCode == 200) {
      newsModel = NewsModel.fromJson(result?.data);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    getNameData();

    super.initState();
  }

  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : PageView.builder(
            // itemCount: newsModel!.articles!.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (
              BuildContext context,
              int i,
            ) {
              return TransitionPage(
                title: newsModel?.articles![i % newsModel!.articles!.length].title,
                image: newsModel?.articles![i % newsModel!.articles!.length].image,
                content: newsModel?.articles![i % newsModel!.articles!.length].content,
              );
            },
          );
  }
}
