import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewsapp/medules/busnise.dart';
import 'package:mynewsapp/medules/sciense.dart';
import 'package:mynewsapp/medules/settings.dart';
import 'package:mynewsapp/medules/sports.dart';
import 'package:mynewsapp/shared/cubit/states.dart';
import 'package:mynewsapp/shared/network/local/prefrences.dart';
import 'package:mynewsapp/shared/network/remote/dio_helper.dart';

class Appcubit extends Cubit<Appstates>
{
  Appcubit() : super(Initial());

  static Appcubit get(context) => BlocProvider.of( context);

  int currentindex=0;
  List<BottomNavigationBarItem>bottomItems=[
    BottomNavigationBarItem(
      icon:Icon (
        Icons.business_center_outlined,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon:Icon (
        Icons.sports_baseball_outlined,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon:Icon (
        Icons.science_outlined,
      ),
      label: 'Science',
    ),


  ];

  List<Widget>screens=[
    BusniseScreen(),
    SportScreen(),
    ScienceScreen(),

  ];

  void changeindex({required int index}) {
    currentindex=index;
    if(index==1)
      {
        getsports();
      }
    else if(index==2)
      {
        getscience();
      }
    else if(index==0)
      {
        getbusiness();
      }
    emit(BottomNaveState());
  }

  List<dynamic>business=[];

  void getbusiness()
  {
    emit(LoadingsnewsState());
    Diohelper.getdata(
        url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'business',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        }
    ).then((value) {
     // print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0]['title']);
      emit(GetbusineesnewsState());
    }).catchError((error){
      print(error.toString());
      emit(GetbusineesnewsState());
    });
  }

  List<dynamic>sports=[];

  void getsports()
  {
    emit(LoadingsnewsState());
    Diohelper.getdata(
        url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'sports',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        }
    ).then((value) {
      // print(value.data['articles'][0]['title']);
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(GetbusineesnewsState());
    }).catchError((error){
      print(error.toString());
      emit(GetbusineesnewsState());
    });
  }

  List<dynamic>science=[];
  void getscience()
  {
    emit(LoadingsnewsState());
    Diohelper.getdata(
        url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'science',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        }
    ).then((value) {
      // print(value.data['articles'][0]['title']);
      science = value.data['articles'];
      print(science[0]['title']);
      emit(GetbusineesnewsState());
    }).catchError((error){
      print(error.toString());
      emit(GetbusineesnewsState())
      ;    });
  }

  List<dynamic>search=[];
  void getsearch(String value)
  {
    emit(LoadingsnewsState());
    search=[];
    Diohelper.getdata(
        url: 'v2/everything',
        query:{
          'q':'$value',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        }
    ).then((value) {
      // print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);
      emit(GetbusineesnewsState());
    }).catchError((error){
      print(error.toString());
      emit(GetbusineesnewsState())
      ;    });
  }

 //  void changeme()
 //  {
 //    isdark=!isdark;
 //    emit(Initial());
 //  }
 // late bool isdark=false;
 //
 //  bool changemode(){
 //    emit(GetbusineesnewsState());
 //    isdark;
 //    emit(GetbusineesnewsState());
 //    return isdark;
 //
 //  }
 //  bool mody()
 //  {
 //    emit(GetbusineesnewsState());
 //    return isdark;
 //  }

 bool isDark=true;
  ThemeMode currentTheme(){
    emit(Initial());
    return cachHelper.getdata(key: 'isdark',)!?ThemeMode.dark:ThemeMode.light;
  }
  void switchmode ({bool? shared}){
    if(shared!=null) {
      emit(Initial());
      isDark = shared;
    }
    else {
      isDark = !isDark;
      cachHelper.putdata(key: 'isdark', value: isDark).then((value) {
        emit(Initial());
      });
    }

  }
}