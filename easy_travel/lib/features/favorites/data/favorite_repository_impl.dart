import 'package:easy_travel/features/favorites/data/favorite_dao.dart';
import 'package:easy_travel/features/favorites/domain/favorite_repository.dart';
import 'package:easy_travel/features/home/domain/destination.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteDao dao;
  const FavoriteRepositoryImpl({required this.dao});

  @override
  Future<void> delete(int id) async {
    await dao.delete(id);
  }

  @override
  Future<List<Destination>> fetchAll() async {
    return dao.fetchAll();
  }

  @override
  Future<void> insert(Destination destination) {
    return dao.insert(destination);
  }
}
