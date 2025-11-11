import 'package:easy_travel/features/home/data/destination_service.dart';
import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:easy_travel/features/home/domain/destination_repository.dart';

class DestinationRepositoryImpl implements DestinationRepository {
  final DestinationService service;
  const DestinationRepositoryImpl({required this.service});

  @override
  Future<List<Destination>> getDestinationsByCategory(String category) async {
    return await service.getDestinationsByCategory(category: category);
  }
}
