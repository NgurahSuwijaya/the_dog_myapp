import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_dog_myapp/presentation/pages/bloc/the_dog_fav/the_dog_fav_bloc.dart';

class FavDogPage extends StatefulWidget {
  static const ROUTE_NAME = 'fav-dog';
  const FavDogPage({super.key});

  @override
  State<FavDogPage> createState() => _FavDogPageState();
}

class _FavDogPageState extends State<FavDogPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => {context.read<TheDogFavBloc>().add(OnTheDogFavEvent())});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The dog my fav')),
      body:
          BlocBuilder<TheDogFavBloc, TheDogFavState>(builder: (context, state) {
        if (state is TheDogFavLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TheDogFavEmpty) {
          return const Center(child: Text("Data is empty"));
        } else if (state is TheDogFavError) {
          return Center(child: Text(state.message));
        } else if (state is TheDogFavHasData) {
          return GridView.builder(
            itemCount: state.result.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Image.network(
                      state.result[index].image?.url?.toString() ??
                          'https://cdn.discordapp.com/attachments/856786757516918784/1152763696142090280/istockphoto-537289161-612x612.jpeg',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.9),
          );
        } else {
          return const Text("Failed");
        }
      }),
    );
  }
}
