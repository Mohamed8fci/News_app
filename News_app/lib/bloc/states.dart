abstract class NewsStates{}

class NewInitialStates extends NewsStates{}

class NewsBottomNavState extends NewsStates{}

class NewsLoadBusinessStates extends NewsStates{}

class NewsGetBuisnessSucssesStates extends NewsStates{}

class NewsGetBuisnessErrorStates extends NewsStates{
  final String error;
  NewsGetBuisnessErrorStates(this.error);

}

class NewsLoadSportsStates extends NewsStates{}

class NewsGetSportsSucssesStates extends NewsStates{}

class NewsGetSportsErrorStates extends NewsStates{
  final String error;
  NewsGetSportsErrorStates(this.error);

}
class NewsChangeModeStates extends NewsStates{}

class NewsLoadScienesStates extends NewsStates{}

class NewsGetScienesSucssesStates extends NewsStates{}

class NewsGetScienesErrorStates extends NewsStates{
  final String error;
  NewsGetScienesErrorStates(this.error);

}

class NewsLoadSearchStates extends NewsStates{}

class NewsGetSearchSucssesStates extends NewsStates{}

class NewsGetSearchErrorStates extends NewsStates{
  final String error;
  NewsGetSearchErrorStates(this.error);

}