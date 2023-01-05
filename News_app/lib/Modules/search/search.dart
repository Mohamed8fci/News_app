import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/bloc.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/shared/components.dart';

class Search_Screen extends StatelessWidget {


  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
       builder: (context, state) {
        var list = NewsCubit.get(context).search;

            return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: searchController,
                validator: (String? value){
                  if(value!.isEmpty){
                    return 'search must not be not empty';
                  }
                  return null;
                },
                onChanged: (value){
                   NewsCubit.get(context).getSearch(value);
                },
                decoration: InputDecoration(labelText: "Search",
                    prefix: Icon(Icons.search)
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Expanded(child: articleBuilder(list, context,isSearch: true)),
          ],
        ),
      );
       },
       );
  }
}
