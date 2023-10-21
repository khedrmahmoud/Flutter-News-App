
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Diohelp
{
  static late Dio dio;
  static init() {
    dio=Dio(
        BaseOptions(
          baseUrl: 'https://newsapi.org/',
          receiveDataWhenStatusError: true,
        )
    );
  }

  static Future<Response> getdata({
    required String url,
    required dynamic query,
  })
  async{
    return await dio.get(url,queryParameters:query, );
  }
}