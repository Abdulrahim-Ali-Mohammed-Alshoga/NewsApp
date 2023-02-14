import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../business_logic/bloc/news_cubit.dart';
import '../../data/repository/news_hive_repository.dart';
import '../../data/repository/news_repository.dart';
import '../../data/web_services/news_web_services.dart';
import '../../my_colors.dart';
import 'anime_sreen.dart';
import 'game_screen.dart';
import 'sport_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int firstPage = 1;

  final page = [
    BlocProvider.value(
        value:
            NewsCubit(NewsRepository(NewsWebServices()), NewsHiveRepository()),
        child: const AnimeSreen()),
    BlocProvider.value(
        value:
            NewsCubit(NewsRepository(NewsWebServices()), NewsHiveRepository()),
        child: const GameScreen()),
    BlocProvider.value(
        value:
            NewsCubit(NewsRepository(NewsWebServices()), NewsHiveRepository()),
        child: const SportScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[firstPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MyColors.myPink,
        currentIndex: firstPage,
        unselectedItemColor: Colors.white,
        fixedColor: MyColors.myBlack,
        onTap: (v) {
          setState(() {
            firstPage = v;
            //   BlocProvider.of<NewsCubit>(context).close();
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_basketball_outlined), label: ""),
        ],
      ),
    );
  }
}
