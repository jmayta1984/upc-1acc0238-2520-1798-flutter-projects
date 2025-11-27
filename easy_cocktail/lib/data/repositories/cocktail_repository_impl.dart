import 'package:easy_cocktail/data/remote/cocktail_dto.dart';
import 'package:easy_cocktail/data/remote/cocktatil_service.dart';
import 'package:easy_cocktail/domain/models/cocktail.dart';
import 'package:easy_cocktail/domain/repositories/cocktail_repository.dart';

class CocktailRepositoryImpl implements CocktailRepository {
  final CocktatilService service;
  const CocktailRepositoryImpl({required this.service});

  @override
  Future<List<Cocktail>> searchCocktails(String query) async {
    try {
      final List<CocktailDto> dtos = await service.searchCocktails(query);
      return dtos.map((dto) => dto.toDomain()).toList();
    } catch (e) {
      return Future.error(e);
    }
  }
}
