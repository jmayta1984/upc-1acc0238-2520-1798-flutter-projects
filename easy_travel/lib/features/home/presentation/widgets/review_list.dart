import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/features/home/domain/review.dart';
import 'package:easy_travel/features/home/presentation/blocs/reviews_bloc.dart';
import 'package:easy_travel/features/home/presentation/blocs/reviews_state.dart';
import 'package:easy_travel/features/home/presentation/widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ReviewsBloc, ReviewsState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.loading:
              return const Center(child: CircularProgressIndicator());
            case Status.success:
              return ListView.builder(
                itemCount: state.reviews.length,
                itemBuilder: (context, index) {
                  final Review review = state.reviews[index];
                  return ReviewCard(review: review);
                },
              );
            case Status.failure:
              return Center(child: Text(state.message ?? 'Unknown error'));
            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
