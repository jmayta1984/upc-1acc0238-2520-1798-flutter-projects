import 'package:easy_cocktail/core/enums/status.dart';
import 'package:easy_cocktail/domain/models/cocktail.dart';
import 'package:easy_cocktail/presentation/blocs/cocktails_bloc.dart';
import 'package:easy_cocktail/presentation/blocs/cocktails_even.dart';
import 'package:easy_cocktail/presentation/blocs/cocktails_state.dart';
import 'package:easy_cocktail/presentation/widgets/cocktail_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CocktailsPage extends StatelessWidget {
  const CocktailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search',
                ),
                onChanged: (value) =>
                    context.read<CocktailsBloc>().add(QueryChanged(value)),
                onSubmitted: (_) =>
                    context.read<CocktailsBloc>().add(SearchCocktails()),
              ),
            ),
            Expanded(
              child:
                  BlocSelector<
                    CocktailsBloc,
                    CocktailsState,
                    (Status, List<Cocktail>, String?)
                  >(
                    selector: (state) =>
                        (state.status, state.cocktails, state.message),
                    builder: (context, state) {
                      final (status, cocktails, message) = state;
                      switch (status) {
                        case Status.loading:
                          return const Center(child: CircularProgressIndicator());
                        case Status.failure:
                          return Center(child: Text(message ?? 'Unknown error'));
                        case Status.success:
                          return CocktailList(cocktails: cocktails);
                        default:
                          return const Center(child: SizedBox.shrink());
                      }
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
