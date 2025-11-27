import 'package:easy_cocktail/core/enums/status.dart';
import 'package:easy_cocktail/domain/models/cocktail.dart';

class CocktailsState {
  final Status status;
  final List<Cocktail> cocktails;
  final String query;
  final String? message;

  const CocktailsState({
    this.status = Status.initial,
    this.cocktails = const [],
    this.query = '',
    this.message,
  });

  CocktailsState copyWith({
    Status? status,
    List<Cocktail>? cocktails,
    String? query,
    String? message
  }) {
    return CocktailsState(
      status: status ?? this.status,
      cocktails: cocktails ?? this.cocktails,
      query: query ?? this.query,
      message: message ?? this.message,
    );
  }
}
