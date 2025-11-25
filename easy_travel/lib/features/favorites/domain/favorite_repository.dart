import 'package:easy_travel/features/home/domain/destination.dart';

abstract class FavoriteRepository {
  Future<void> insert(Destination destination);
  Future<void> delete(int id);
  Future<List<Destination>> fetchAll();
  Future<bool> isFavorite(int id);
  Future<Set<int>> fetchAllIds();
}
