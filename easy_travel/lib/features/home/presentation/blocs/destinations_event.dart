abstract class DestinationsEvent {
  const DestinationsEvent();
}

class GetDestinationsByCategoryEvent extends DestinationsEvent {
  final String category;
  const GetDestinationsByCategoryEvent({required this.category});
}

class GetAllDestinationsEvent extends DestinationsEvent {
    const GetAllDestinationsEvent();

}
