part of 'cat_bloc.dart';

@immutable
sealed class CatEvent {}


final class GetCatListEvent extends CatEvent {
  GetCatListEvent();
}

final class GetCatListFilteredEvent extends CatEvent {
  final List<Cat> catList;
  final String breed;
  
  GetCatListFilteredEvent(this.catList, this.breed);
}
