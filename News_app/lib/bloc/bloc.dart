import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Modules/science/science.dart';
import 'package:news_app/Modules/sports/sports.dart';
import 'package:news_app/Network/local/CacheHelper.dart';
import 'package:news_app/bloc/states.dart';
import '../Modules/business/busines.dart';
import '../Network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewInitialStates());
  static NewsCubit get(context) => BlocProvider.of(context);


  int current_index = 0;

  List <BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center),
      label: 'business'
    ),

    BottomNavigationBarItem(
        icon: Icon(Icons.sports_football),
        label: 'Sports'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label: 'Science'
    ),


  ];

  List<Widget> screens = [
    Business_Layout(),
    Sports_Layout(),
    Science_Layout(),

  ];

  void ChangeBottomNavBar(int index){
    current_index = index;
    if(index == 1){
      getSports();
    }
    if(index == 2){
      getSciences();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness(){
    emit(NewsLoadBusinessStates());
    DioHelper.getData(url: 'v2/top-headlines',
      query:{
        'country':'eg',
        'category':'business',
        'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      //print(value.data['totalResults']);
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBuisnessSucssesStates());
    }).catchError((onError){
      print(onError.toString());
      emit(NewsGetBuisnessErrorStates(onError.toString()));
    });
  }


  List<dynamic> sports = [];

  void getSports(){
    emit(NewsLoadSportsStates());
    if(sports.length == 0){
      DioHelper.getData(url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'sports',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        //print(value.data['totalResults']);
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSucssesStates());
      }).catchError((onError){
        print(onError.toString());
        emit(NewsGetSportsErrorStates(onError.toString()));
      });
    }else{
      emit(NewsGetSportsSucssesStates());
    }

  }

  List<dynamic> sciences = [];

  void getSciences(){
    emit(NewsLoadScienesStates());

    if(sciences.length == 0){
      DioHelper.getData(url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'science',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        //print(value.data['totalResults']);
        sciences = value.data['articles'];
        print(sciences[0]['title']);
        emit(NewsGetScienesSucssesStates());
      }).catchError((onError){
        print(onError.toString());
        emit(NewsGetScienesErrorStates(onError.toString()));
      });
    }else{
      emit(NewsGetScienesSucssesStates());

    }
  }

  bool isDark = false;
  void changeAppMode({bool? fromShared}){
    if(fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeModeStates());
    }else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeModeStates());
      });
    }
  }

  List<dynamic> search = [];

  void getSearch(String value){
    emit(NewsLoadSearchStates());
    if(search.length == 0){
      DioHelper.getData(url: 'v2/everything',
        query:{
          'q':'$value',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        //print(value.data['totalResults']);
        search = value.data['articles'];
        print(search[0]['title']);
        emit(NewsGetSearchSucssesStates());
      }).catchError((onError){
        print(onError.toString());
        emit(NewsGetSearchErrorStates(onError.toString()));
      });
    }
  }
}