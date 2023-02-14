import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/route_app.dart';

import 'package:path_provider/path_provider.dart';

import 'business_logic/bloc/theme_cubit.dart';
import 'business_logic/bloc/theme_state.dart';
import 'data/models/hive/news_hive.dart';
import 'data/repository/news_hive_repository.dart';
import 'my_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory=await getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path);
  Hive.registerAdapter(NewsHiveAdapter());
  await Hive.openBox('light');
  await Hive.openBox<NewsHive>('anime');
  await Hive.openBox<NewsHive>('sport');
  await Hive.openBox<NewsHive>('games');
  runApp(
      MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (context) => ThemeCuibt(),
          ),
      // BlocProvider(
      //   create: (context) => NewsCubit(NewsRepository(NewsWebServices()),NewsHiveRepository()),
      // ),
    ],  child: MyApp(
          routeApp: RouteApp(),
  ),

  ));
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
    required this.routeApp,
  });

  final RouteApp routeApp;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411,891),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return BlocBuilder<ThemeCuibt, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "News",
              onGenerateRoute: routeApp.generateRoute,
              theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      iconTheme: IconThemeData(color: Colors.black),
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent,
                        statusBarIconBrightness: Brightness.dark,
                      ),
                      titleTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20)),
                  textTheme: TextTheme(

                    headline1:  TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle2: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  scaffoldBackgroundColor: Colors.white,
                  primaryColor: MyColors.myPink,
                  backgroundColor: Colors.red),
              darkTheme: ThemeData(

                  scaffoldBackgroundColor: MyColors.myBlack,
                  primaryColor: MyColors.myPink,
                  textTheme:   TextTheme(
                    headline1:  TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),

                    subtitle2: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  appBarTheme: const AppBarTheme(
                      elevation: 0,
                      backgroundColor: MyColors.myBlack,
                      iconTheme: IconThemeData(color: Colors.white),
                      titleTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarIconBrightness: Brightness.light,
                          statusBarColor: Colors.transparent))),
              themeMode: BlocProvider.of<ThemeCuibt>(context).light
                  ? ThemeMode.light
                  : ThemeMode.dark,
            );
          },
        );
      },

    );
  }
}
