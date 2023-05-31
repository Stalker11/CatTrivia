import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/cat_fact.dart';
import '../cat_fact_repository.dart';

enum CatFactEvent {
  getRandomFact,
}

class CatFactState {
  final CatFactsResponse? fact;
  final bool isLoading;

  CatFactState({this.fact, this.isLoading = false});
}

class CatFactBloc extends Bloc<CatFactEvent, CatFactState> {
  final CatFactRepository repository;

  CatFactBloc({required this.repository}) : super(CatFactState()){
    on<CatFactEvent>((event, emit) => onEvent(CatFactEvent.getRandomFact));
  }

  @override
  Future<void> onEvent(CatFactEvent event) async {
    super.onEvent(event);
    if (event == CatFactEvent.getRandomFact) {
      emit(state.copyWith(isLoading: true));
      final fact = await repository.getRandomFact();
      emit(state.copyWith(fact: fact, isLoading: false));
    }
  }
}

extension CopyWithExtension on CatFactState {
  CatFactState copyWith({CatFactsResponse? fact, bool? isLoading}) {
    return CatFactState(
      fact: fact ?? this.fact,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}