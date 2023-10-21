
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewsapp/shared/components/components.dart';
import 'package:mynewsapp/shared/cubit/cubit.dart';
import 'package:mynewsapp/shared/cubit/states.dart';

class Search extends StatelessWidget {

var searchcontrol=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,Appstates>(
      listener: (Context,state){},
      builder: (Context,state)
      {
        var List =Appcubit.get(context).search;
        if(List.isNotEmpty) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: searchcontrol,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Appcubit.get(context).getsearch(value);
                    },
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'search is empty';
                      }
                      return null;
                    }),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),

                Expanded(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildarticleItem(List[index], context),
                    separatorBuilder: (context, index) => devider(),
                    itemCount: List.length,
                  ),
                )


              ],
            ),
          );
        }
        else
          {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: searchcontrol,
                      cursorColor: Colors.grey,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        Appcubit.get(context).getsearch(value);
                      },
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'search is empty';
                        }
                        return null;
                      }),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        focusColor: Colors.grey,
                      ),
                    ),
                  ),

                  Expanded(
                   child: Center(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Text(
                             'No Result yet',
                           style:TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 20,
                             color: Colors.grey,
                           ),
                         )
                       ],
                     ),
                   ),
                  )


                ],
              ),
            );
          }
      },
    );




  }
}
