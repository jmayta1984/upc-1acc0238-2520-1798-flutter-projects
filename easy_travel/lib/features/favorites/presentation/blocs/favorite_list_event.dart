abstract class FavoriteListEvent {
  const FavoriteListEvent();
}

class GetAllFavorites extends FavoriteListEvent {
  const GetAllFavorites();
}

class RemoveFavorite extends FavoriteListEvent {
  final int id;
  const RemoveFavorite({required this.id});
}
