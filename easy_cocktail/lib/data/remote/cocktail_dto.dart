import 'package:easy_cocktail/domain/models/cocktail.dart';

class CocktailDto {
  final String id;
  final String name;
  final String category;
  final String posterPath;

  const CocktailDto({
    required this.id,
    required this.name,
    required this.category,
    required this.posterPath,
  });

  factory CocktailDto.fromJson(Map<String, dynamic> json) {
    return CocktailDto(
      id: json['idDrink'] as String,
      name: json['strDrink'] as String,
      category: json['strCategory'] as String,
      posterPath: json['strDrinkThumb'] as String,
    );
  }
  Cocktail toDomain() {
    return Cocktail(
      id: id,
      name: name,
      category: category,
      posterPath: posterPath,
    );
  }
}
