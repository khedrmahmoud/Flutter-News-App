
import 'dart:core';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Diohelper
{
 static
 late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: 'https://newsapi.org/',


      ),

    );
  }

  static Future<Response> getdata({
    required  String url,
    required Map<String, dynamic> query,
  }) async
  {
    HttpClient;
    HttpStatus.ok;
    return await dio.get(
      url,
      queryParameters: query,
    );
  }




}



//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
//https://newsapi.org/v2/top-headlines?country=eg&apiKey=API_KEY