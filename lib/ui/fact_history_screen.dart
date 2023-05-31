import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/block/cat_fact_state.dart';

class FactHistoryScreen extends StatelessWidget {
  const FactHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatFactBloc, CatFactState>(
      builder: (context, state) {
        final factHistory = context.select((CatFactBloc bloc) => bloc.repository.getFactHistory());
        //TODO Pagination must be implemented later
        final history = factHistory[0];
        return Scaffold(
          appBar: AppBar(
            title: const Text('Fact History'),
          ),
          body: ListView.builder(
            itemCount: factHistory[0].data.length,
            itemBuilder: (context, index) {
              final fact = factHistory[index];
              return ListTile(
                title: Text(history.data[index].fact),
                subtitle: Text('Created at: ${history.data[index].length}'),
              );
            },
          ),
        );
      },
    );
  }
}