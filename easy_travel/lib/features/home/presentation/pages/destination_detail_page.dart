import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:easy_travel/features/home/presentation/blocs/reviews_bloc.dart';
import 'package:easy_travel/features/home/presentation/blocs/reviews_event.dart';
import 'package:easy_travel/features/home/presentation/widgets/review_list.dart';
import 'package:easy_travel/features/home/presentation/widgets/review_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DestinationDetailPage extends StatelessWidget {
  const DestinationDetailPage({super.key, required this.destination});
  final Destination destination;

  @override
  Widget build(BuildContext context) {
    int rating = 0;
    String comment = '';
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => Dialog(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        'Leave a comment',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        onChanged: (value) {
                          comment = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Your comment',
                          border: OutlineInputBorder(),
                        ),
                        minLines: 3,
                        maxLines: 3,
                      ),
                      ReviewRating(
                        onRatingSelected: (selectedRating) {
                          rating = selectedRating;
                        },
                      ),
                      FilledButton(
                        onPressed: () {
                          context.read<ReviewsBloc>().add(
                            SubmitReview(
                              destinationId: destination.id,
                              comment: comment,
                              rating: rating,
                            ),
                          );
                          Navigator.of(context).pop();
                        },
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.add_comment),
      ),
      body: Column(
        children: [
          Hero(
            tag: destination.id,
            child: Image.network(
              destination.posterPath,
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          ReviewList()
        ],
      ),
    );
  }
}
