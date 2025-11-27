abstract class CocktailsEvent {
  const CocktailsEvent();
}

class SearchCocktails extends CocktailsEvent {
  const SearchCocktails();
}

class QueryChanged extends CocktailsEvent {
  final String query;
  const QueryChanged(this.query);
}