import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/bloc/news_cubit.dart';
import '../../business_logic/bloc/news_state.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/list_view_widget.dart';
import '../widgets/loding_image_widget.dart';

class SportScreen extends StatefulWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  State<SportScreen> createState() => _SportScreenState();
}

class _SportScreenState extends State<SportScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(3333333);
    //BlocProvider.of<NewsCubit>(context).getSportNews();
    BlocProvider.of<NewsCubit>(context).getNews("sport");
  }

  // final GlobalKey<ScaffoldState> _scaffoldKey3 = GlobalKey<ScaffoldState>();
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //  BlocProvider.of<NewsCubit>(context).close();
  //   super.dispose();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(nameAppBar: "Sport"),
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
