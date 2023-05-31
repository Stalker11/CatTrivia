import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/block/cat_fact_state.dart';
import '../domain/cat_fact_repository.dart';

class MainScreen extends StatelessWidget {
  late CatFactBloc _bloc;
  late CatFactRepository _repository;

  @override
  Widget build(BuildContext context) {
    _repository = CatFactRepository();
    _bloc = CatFactBloc(repository: _repository);
    _repository.initialize().whenComplete(() => _bloc..add(CatFactEvent.getRandomFact));
    return BlocProvider(
      create: (_) => _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cat Facts'),
        ),
        body: BlocBuilder<CatFactBloc, CatFactState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.fact != null) {
              final fact = state.fact!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    fact.data[1].fact,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Created at: ${fact.data[1].length}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => context.read<CatFactBloc>().add(CatFactEvent.getRandomFact),
                    child: const Text('Another Fact!'),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('No fact available.'));
            }
          },
        ),
      ),
    );
  }
}