import 'package:easy_cocktail/domain/models/cocktail.dart';
import 'package:easy_cocktail/presentation/widgets/cocktail_card.dart';
import 'package:flutter/material.dart';

class CocktailList extends StatelessWidget {
  final List<Cocktail> cocktails;
  const CocktailList({super.key, required this.cocktails});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cocktails.length,
      itemBuilder: (context, index) {
        final cocktail = cocktails[index];
        return CocktailCard(cocktail: cocktail);
      },
    );
  }
}
