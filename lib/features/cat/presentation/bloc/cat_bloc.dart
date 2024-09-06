import 'package:bloc/bloc.dart';
import 'package:cats/features/cat/data/models/cat.dart';
import 'package:cats/features/cat/domain/usecases/cat_use_case.dart';
import 'package:meta/meta.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatUseCase useCase;
  CatBloc({required this.useCase}) : super(CatInitial()) {
    on<GetCatListEvent>(_getCatList);
    on<GetCatListFilteredEvent>(_getCatListFiltered);
  }

  Future<void> _getCatList(GetCatListEvent event, Emitter<CatState> emit) async {
    emit(LoadingState());
    final response = await useCase.getList();
    response.fold((failure) => emit(ErrorState(message: failure.message)), (catList) => emit(CatListState(catList)));
  }

  Future<void> _getCatListFiltered(GetCatListFilteredEvent event, Emitter<CatState> emit) async {
    
    final catListFiltered = useCase.filterCatList(event.catList, event.breed);
    emit(CatListFilteredState(catListFiltered));
    
  }
}
