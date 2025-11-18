import 'package:easy_travel/features/home/data/review_service.dart';
import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:easy_travel/features/home/presentation/blocs/reviews_bloc.dart';
import 'package:easy_travel/features/home/presentation/blocs/reviews_event.dart';
import 'package:easy_travel/features/home/presentation/widgets/review_rating.dart';
import 'package:easy_travel/features/home/presentation/widgets/review_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DestinationDetailPage extends StatelessWidget {
  const DestinationDetailPage({super.key, required this.destination});
  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        'Leave a comment',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Your comment',
                          border: OutlineInputBorder(),
                        ),
                        minLines: 3,
                        maxLines: 3,
                      ),
                      ReviewRating(),
                      FilledButton(
                        onPressed: () {
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
        child: const Icon(Icons.add),
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
          BlocProvider(
            create: (context) =>
                ReviewsBloc(service: ReviewService())
                  ..add(GetReviewsByDestinatioId(id: destination.id)),
            child: ReviewList(),
          ),
        ],
      ),
    );
  }
}
