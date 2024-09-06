part of 'cat_bloc.dart';

@immutable
sealed class CatState {}

final class CatInitial extends CatState {}

class CatListState extends CatState {
  final List<Cat> catList;

  CatListState(this.catList);
}

class CatListFilteredState extends CatState {
  final List<Cat> catListFiltered;

  CatListFilteredState(this.catListFiltered);
}

class LoadingState extends CatState {}

class ErrorState extends CatState {
  final String message;
  ErrorState({required this.message});
}
