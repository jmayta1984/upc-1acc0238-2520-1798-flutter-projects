import 'package:easy_cocktail/domain/models/cocktail.dart';

abstract class CocktailRepository {
  Future<List<Cocktail>> searchCocktails(String query);
}
