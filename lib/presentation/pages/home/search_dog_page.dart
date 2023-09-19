import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_dog_myapp/presentation/pages/bloc/search_dog/search_dog_bloc.dart';
import 'package:the_dog_myapp/presentation/widget/dog_card.dart';

class SearchDogPage extends StatelessWidget {
  static const ROUTE_NAME = '/search-dog';

  const SearchDogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (query) {
                context.read<SearchDogBloc>().add(OnDogQueryChanged(query));
              },
              decoration: const InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(
              height: 40,
            ),
            BlocBuilder<SearchDogBloc, SearchDogState>(
                builder: ((context, state) {
              if (state is SearchDogLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SearchDogEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [const Text("Search Not Found")],
                  ),
                );
              } else if (state is SearchDogError) {
                return Expanded(
                  child: Center(
                    child: Text(state.message),
                  ),
                );
              } else if (state is SearchDogHasData) {
                final data = state.result;
                print(data.length);
                return Expanded(
                    child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                    return DogCard(dog: data[index]);
                  }),
                ));
              } else {
                return const Center(
                  child: Text('Failed'),
                );
              }
            }))
          ],
        ),
      ),
    );
  }
}
