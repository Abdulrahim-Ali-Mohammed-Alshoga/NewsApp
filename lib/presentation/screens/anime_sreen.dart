import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/bloc/news_cubit.dart';
import '../../business_logic/bloc/news_state.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/list_view_widget.dart';
import '../widgets/loding_image_widget.dart';

class AnimeSreen extends StatefulWidget {
  const AnimeSreen({Key? key}) : super(key: key);

  @override
  State<AnimeSreen> createState() => _AnimeSreenState();
}

class _AnimeSreenState extends State<AnimeSreen> {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(1111111);
    BlocProvider.of<NewsCubit>(context).getNews("anime");
  }

  // final GlobalKey<ScaffoldState> _scaffoldKey1 = GlobalKey<ScaffoldState>();
  // @override
  // void d() {
  //   // TODO: implement dispose
  // //  BlocProvider.of<NewsCubit>(context).close();
  //   print("123");
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(nameAppBar: 'Anime'),
      body: BlocBuilder<NewsCubit, NewsState>(builder: ((context, state) {
        if (state is NewsInitial) {
          return Container();
        } else if (state is NewsLoading) {
          return const LodingImageWidget();
        } else if (state is NewsSuccess) {
          return ListViewWidget(news: BlocProvider.of<NewsCubit>(context).news);
        }
        return Container();
      })),
    );
  }
}
