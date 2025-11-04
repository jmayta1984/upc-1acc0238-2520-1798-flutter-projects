import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:flutter/material.dart';

class DestinationCard extends StatelessWidget {
  const DestinationCard({super.key, required this.destination});
  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Hero(
              tag: destination.id,
              child: Image.network(
                destination.posterPath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(destination.overview, maxLines: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
