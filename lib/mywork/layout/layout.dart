
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewsapp/mywork/medules/business.dart';
import 'package:mynewsapp/mywork/shared/cubite/cubit.dart';
import 'package:mynewsapp/mywork/shared/cubite/states.dart';
import 'package:mynewsapp/mywork/shared/network/remote.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create:(context)=>Cubite(),
      child: BlocConsumer<Cubite,States>(
        listener: (context,state){},
        builder:(context,state)
    {
      var cubit=Cubite.get(context);
      return Scaffold(
            appBar: AppBar(
              title: Text(
                'My News',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions:[
                IconButton(
                  onPressed: (){},
                  icon:Icon(
                    Icons.search,
                  color: Colors.black,
                ),
                )
              ],
            ),
            body: cubit.screen2(index: cubit.currentindex),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentindex,
              onTap: (index){
                  cubit.bottomstate(index: index);
                  //cubit.getbusiness();
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.business),label: 'business'),
                BottomNavigationBarItem(icon: Icon(Icons.sports_baseball_outlined),label: 'sports'),
                BottomNavigationBarItem(icon: Icon(Icons.science),label: 'science'),
                BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'settings'),
              ],
            ),
          );
    }

    )
    );
  }
}
