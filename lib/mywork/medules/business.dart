
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewsapp/mywork/shared/components.dart';
import 'package:mynewsapp/mywork/shared/cubite/cubit.dart';
import 'package:mynewsapp/mywork/shared/cubite/states.dart';

class bussines extends StatelessWidget {
  const bussines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubite, States>(
        listener: (context, state) {},
        builder: (context, States) {
          var cubit=Cubite.get(context);
          List<dynamic>list =cubit.dioh;
          cubit.getdio(category: 'business');
          if(list.isNotEmpty){
            return ListView.separated(
              itemBuilder: (context, index) => builditem(list[index]),
              separatorBuilder: (context, index) => devider(),
              itemCount: list.length
          );
    }
    else
      {
      return Center(
      child: Container(
      child: CircularProgressIndicator(),
          ),
      );
      }
        }
    );


}
  }