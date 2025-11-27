import 'dart:async';

import 'package:easy_cocktail/core/enums/status.dart';
import 'package:easy_cocktail/domain/repositories/cocktail_repository.dart';
import 'package:easy_cocktail/presentation/blocs/cocktails_even.dart';
import 'package:easy_cocktail/presentation/blocs/cocktails_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CocktailsBloc extends Bloc<CocktailsEvent, CocktailsState> {
  final CocktailRepository repository;
  CocktailsBloc({required this.repository}) : super(CocktailsState()) {
    on<SearchCocktails>(_searchCocktails);

    on<QueryChanged>(_queryChanged);
  }

  FutureOr<void> _searchCocktails(
    SearchCocktails event,
    Emitter<CocktailsState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final cocktails = await repository.searchCocktails(state.query);
      emit(state.copyWith(status: Status.success, cocktails: cocktails));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }

  FutureOr<void> _queryChanged(
    QueryChanged event,
    Emitter<CocktailsState> emit,
  ) {
    emit(state.copyWith(query: event.query));
  }
}
