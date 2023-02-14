
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/bloc/theme_cubit.dart';
import '../../business_logic/bloc/theme_state.dart';
import '../../strings.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  String nameAppBar;
  AppBarWidget({Key? key,required this.nameAppBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCuibt, ThemeState>(
      builder: (context, state) {
        return PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Search_Screen);
                  },
                  icon: Icon(
                    Icons.search,
                  )),
              IconButton(
                onPressed: () {
                  BlocProvider.of<ThemeCuibt>(context).chooseTheme();
                },
                icon: Icon(
                  BlocProvider.of<ThemeCuibt>(context).light
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
              ),
            ],
            title: Text("News App - $nameAppBar"),
          ),
        );
      },
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
