import 'package:flutter/material.dart';
import 'package:mynewsapp/mywork/medules/business.dart';
import 'package:mynewsapp/mywork/medules/science.dart';
import 'package:mynewsapp/mywork/medules/settings.dart';
import 'package:mynewsapp/mywork/medules/sports.dart';
import 'package:mynewsapp/mywork/shared/cubite/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewsapp/mywork/shared/network/remote.dart';
class Cubite extends Cubit<States>
{
   Cubite():super(initial());
   static Cubite get(context) => BlocProvider.of(context);

   int currentindex=0;
   void bottomstate({required int index})
   {
     currentindex=index;
     emit(initial());
   }

   List<Widget>screens2=[
     bussines(),
     sports(),
     science(),
     settings(),
   ];
   Widget screen2({required int index})
   {
     emit(initial());
    return screens2[index];
   }

   List<dynamic>dioh=[];
   void getdio({required String category,})
   {
     emit(initial());
     Diohelp.getdata(
       url: 'v2/top-headlines',
         query: {
           'country':'eg',
           'category':'$category',
           'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'
         }).then((value) {
           dioh=value.data['articles'];
           emit(initial());
     }).catchError((error){
   print(error.toString());
   emit(initial());
   });;
   }

   // void getbusiness()
   // {
   //   emit(initial());
   //   Diohelp.getdata(
   //       url: 'v2/top-headlines',
   //       query:{
   //         'country':'eg',
   //         'category':'business',
   //         'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
   //       }
   //   ).then((value) {
   //     // print(value.data['articles'][0]['title']);
   //     dioh = value.data['articles'];
   //     print(dioh[0]['title']);
   //     emit(initial());
   //   }).catchError((error){
   //     print(error.toString());
   //     emit(initial());
   //   });
   // }

}