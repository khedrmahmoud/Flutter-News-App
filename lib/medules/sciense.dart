
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewsapp/shared/components/components.dart';
import 'package:mynewsapp/shared/cubit/cubit.dart';
import 'package:mynewsapp/shared/cubit/states.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,Appstates>(
      listener: (context,state){},
      builder: (context,state){
        if(state is!LoadingsnewsState)
        {
          var List=Appcubit.get(context).science;
          return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>buildarticleItem(List[index],context),
            separatorBuilder: (context,index)=>devider(),
            itemCount: List.length,
          );
        }
        else
        {
          return Center(
            child: Container(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      CircularProgressIndicator(),
                      SizedBox(height: 20,),
                      Text(
                        'No Result yet',
                        style:TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      )
                    ]

                )
            ),
          );
        }
      },
    );

  }
}
