import 'package:dio/dio.dart';

getData() async {

  var response = await Dio().get("https://gnews.io/api/v4/search?q=example&lang=en&country=us&max=10&apikey=61296c5d7d57fb9e2ce58f31229b686c");
  // print(response);

  return response ;

}
