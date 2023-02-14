
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/bloc/news_cubit.dart';
import '../../business_logic/bloc/news_state.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/list_view_widget.dart';
import '../widgets/loding_image_widget.dart';


class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  // late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  void initState() {
    // TODO: implement initState
    super.initState();
    print(2222222222) ;
    BlocProvider.of<NewsCubit>(context).getNews("games");
  }
  // final GlobalKey<ScaffoldState> _scaffoldKey2 = GlobalKey<ScaffoldState>();
 //  @override
 //  void didChangeDependencies() {
 //    // TODO: implement dispose
 // //   BlocProvider.of<NewsCubit>(context).close();
 //    print("333");
 //    super.didChangeDependencies();
 //  }
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBarWidget(
        nameAppBar: 'Games',
      ),
      body: BlocBuilder<NewsCubit, NewsState>(builder: ((context, state) {
        if (state is NewsInitial) {
          return Container();
        } else if (state is NewsLoading) {
          return const LodingImageWidget();
        } else if(state is NewsSuccess){
          return ListViewWidget(news: BlocProvider.of<NewsCubit>(context).news);
        }
        return Container();
      })),
    );
    // leading: Container(height: 300,width: 300,color: Colors.grey,child: Image.asset('assets/images/loading2.gif')),
  }
}
