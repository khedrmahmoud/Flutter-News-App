import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mynewsapp/homelayout/homelayout.dart';
import 'package:mynewsapp/shared/cubit/config.dart';
import 'package:mynewsapp/shared/cubit/cubit.dart';
import 'package:mynewsapp/shared/cubit/states.dart';
import 'package:mynewsapp/shared/network/remote/dio_helper.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mynewsapp/shared/network/local/prefrences.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Diohelper.init();
  await cachHelper.init();
  //bool? isDark= cachHelper.getdata(key:'isdark');

  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
  late  bool? isDark= cachHelper.getdata(key:'isdark');
  @override
  Widget build(BuildContext context) {
      return BlocProvider(
        create: (context)=>Appcubit()..switchmode(shared: isDark),
        child:BlocConsumer<Appcubit,Appstates>
          (
          listener: (context,Appstates state){},
          builder: (context ,Appstates state){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                    elevation: 10,
                    color: Colors.white,
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    iconTheme: IconThemeData(
                      color: Colors.black,
                    ),
                    // systemOverlayStyle: SystemUiOverlayStyle(
                    //   statusBarColor: Colors.white,
                    //   statusBarIconBrightness: Brightness.dark,
                    // ),
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                  ),
                  // floatingActionButtonTheme: FloatingActionButtonThemeData(
                  //   backgroundColor: Colors.deepOrange,
                  // ),
                  primarySwatch: Colors.deepOrange,
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )
                  )
              ),
              darkTheme: ThemeData(
                  scaffoldBackgroundColor: HexColor('333739'),
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.black26,
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    iconTheme: IconThemeData(
                      color: Colors.white,
                    ),
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black26,
                      statusBarIconBrightness: Brightness.light,
                    ),
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    backgroundColor: Colors.black26,
                    elevation: 50,
                  ),
                  // floatingActionButtonTheme: FloatingActionButtonThemeData(
                  //   backgroundColor: Colors.deepOrange,
                  // ),
                  primarySwatch: Colors.deepOrange,
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )
                  )
              ),
              //themeMode:ThemeMode.light,
              themeMode:Appcubit.get(context).currentTheme(),
              home: HomeLayout(),

            );
          },
        )

      );
  }
}
