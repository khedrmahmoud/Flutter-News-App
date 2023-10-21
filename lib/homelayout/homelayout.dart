
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewsapp/medules/search.dart';
import 'package:mynewsapp/shared/components/components.dart';
import 'package:mynewsapp/shared/cubit/config.dart';
import 'package:mynewsapp/shared/cubit/cubit.dart';
import 'package:mynewsapp/shared/cubit/states.dart';
import 'package:mynewsapp/shared/network/remote/dio_helper.dart';

class HomeLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>Appcubit()..getbusiness(),
      child: BlocConsumer<Appcubit,Appstates>(
        listener: (context,Appstates state){},
        builder:(context,Appstates state)
        {
          var cubit = Appcubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'News App',
                style: TextStyle(
                ),
              ),
              actions: [
                IconButton(
                    onPressed: (){
                      navigateTo(context,Search());
                    },
                    icon: Icon(Icons.search)
                ),
                IconButton(
                icon: Icon(Icons.brightness_4),
                    onPressed: (){
                        cubit.switchmode();
                    },
                ),
              ],
            ),
            body: cubit.screens[cubit.currentindex],
            // floatingActionButton: FloatingActionButton(
            //   onPressed: (){
            //
            //   },
            //   child: Icon(
            //     Icons.add
            //   ),
            // ),
            bottomNavigationBar:BottomNavigationBar(
             currentIndex: cubit.currentindex,
              items: cubit.bottomItems,
              onTap: (index){
               cubit.changeindex(index: index);
              },
            ) ,
          );
        }

      ),
    );
  }
}
