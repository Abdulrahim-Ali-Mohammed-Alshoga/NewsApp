import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/bloc/theme_cubit.dart';
import '../../business_logic/bloc/theme_state.dart';
import '../../my_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCuibt,ThemeState>(builder: (context,state){
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              BlocProvider.of<ThemeCuibt>(context).chooseTheme();
            }, icon: Icon( BlocProvider.of<ThemeCuibt>(context).light?Icons.dark_mode:Icons.light_mode
              ,)),

          ],

        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 30),

          child: Padding(
            padding: const EdgeInsets.only(right: 20,left: 20),
            child: TextFormField(
              style: const TextStyle(color: Colors.grey),
              decoration: InputDecoration(

                  prefixIcon: Icon(Icons.search,color:Colors.grey ),

                  hintStyle: const TextStyle(color: Colors.grey),
                  labelStyle: const TextStyle(color: Colors.grey),
                  labelText: "Search",
                  hintText: "Enter any word",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2,color: Colors.grey),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2,color: MyColors.myPink),
                      borderRadius: BorderRadius.circular(30)
                  )
              ),

            ),
          ),
        ),
      );
    },
    );
  }
}
