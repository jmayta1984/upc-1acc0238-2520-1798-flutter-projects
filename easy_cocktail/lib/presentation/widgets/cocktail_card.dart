import 'package:easy_cocktail/domain/models/cocktail.dart';
import 'package:flutter/material.dart';

class CocktailCard extends StatelessWidget {
  final Cocktail cocktail;
  const CocktailCard({super.key, required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(cocktail.posterPath),
        title: Text(cocktail.name),
      ),
    );
  }
}