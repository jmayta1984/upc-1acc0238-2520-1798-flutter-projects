import 'package:flutter/material.dart';

class ReviewRating extends StatefulWidget {
  const ReviewRating({super.key});

  @override
  State<ReviewRating> createState() => _ReviewRatingState();
}

class _ReviewRatingState extends State<ReviewRating> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => IconButton(
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: index < rating
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          onPressed: () {
            setState(() {
              rating = index + 1;
            });
          },
        ),
      ),
    );
  }
}
