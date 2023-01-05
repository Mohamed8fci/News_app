import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Modules/search/search.dart';
import 'package:news_app/bloc/bloc.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/shared/components.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {

        var cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
                'News App'
            ),
            actions: [IconButton(onPressed: (){
              navigateTo(context, Search_Screen());
            }, icon: Icon(Icons.search)),
             IconButton(
              icon: Icon(Icons.brightness_4_outlined),
              onPressed: (){
              NewsCubit.get(context).changeAppMode();
              },
            )],
          ),
          body: cubit.screens[cubit.current_index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.current_index,
            onTap: (index){
                cubit.ChangeBottomNavBar(index);
            },
            items: cubit.bottomItems,
          ),
        );
      },
      );

  }
}