import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:easy_travel/features/home/presentation/blocs/home_bloc.dart';
import 'package:easy_travel/features/home/presentation/blocs/home_event.dart';
import 'package:easy_travel/features/home/presentation/blocs/home_state.dart';
import 'package:easy_travel/features/home/presentation/blocs/reviews_bloc.dart';
import 'package:easy_travel/features/home/presentation/blocs/reviews_event.dart';
import 'package:easy_travel/features/home/presentation/widgets/destination_card.dart';
import 'package:easy_travel/features/home/presentation/pages/destination_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final _categories = CategoryType.values;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocSelector<HomeBloc, HomeState, CategoryType>(
          selector: (state) => state.selectedCategory,
          builder: (context, state) {
            return SizedBox(
              height: 48,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final CategoryType category = _categories[index];
                  return FilterChip(
                    selected: state == category,
                    label: Text(category.label),
                    onSelected: (_) => {
                      context.read<HomeBloc>().add(
                        GetDestinationsByCategory(category: category),
                      ),
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 8),
              ),
            );
          },
        ),
        Expanded(
          child:
              BlocSelector<
                HomeBloc,
                HomeState,
                (Status, List<Destination>, String?)
              >(
                selector: (state) =>
                    (state.status, state.destinations, state.message),
                builder: (context, state) {
                  final (status, destinations, meessage) = state;

                  switch (status) {
                    case Status.loading:
                      return const Center(child: CircularProgressIndicator());

                    case Status.failure:
                      return Center(child: Text(meessage ?? 'Unknown error'));

                    case Status.success:
                      return ListView.builder(
                        itemCount: destinations.length,
                        itemBuilder: (context, index) {
                          final Destination destination = destinations[index];
                          return GestureDetector(
                            onTap: () {
                              context.read<ReviewsBloc>().add(
                                GetReviewsByDestinatioId(id: destination.id),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DestinationDetailPage(
                                    destination: destination,
                                  ),
                                ),
                              );
                            },
                            child: DestinationCard(destination: destination),
                          );
                        },
                      );
                    default:
                      return SizedBox.shrink();
                  }
                },
              ),
        ),
      ],
    );
  }
}
