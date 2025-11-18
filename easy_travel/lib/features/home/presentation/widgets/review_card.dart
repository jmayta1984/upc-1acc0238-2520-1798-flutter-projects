import 'package:easy_travel/features/home/domain/review.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final Review review;
  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < review.rating ? Icons.star : Icons.star_border,
                size: 16,
                color: index < review.rating
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),

          Text(review.comment),
          Text(
            review.userName,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
