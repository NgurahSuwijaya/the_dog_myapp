import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_dog_myapp/domain/entities/the_dog.dart';
import 'package:the_dog_myapp/presentation/pages/bloc/the_dog_detail/the_dog_detail_bloc.dart';
import 'package:the_dog_myapp/presentation/pages/bloc/the_dog_fav/the_dog_fav_bloc.dart';

class TheDogDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail-dog';

  final String id;

  TheDogDetailPage({super.key, required this.id});

  @override
  State<TheDogDetailPage> createState() => _TheDogDetailPageState();
}

class _TheDogDetailPageState extends State<TheDogDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TheDogDetailBloc>().add(OnTheDogDetailEvent(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Detail'),
      ),
      body: BlocBuilder<TheDogDetailBloc, TheDogDetailState>(
          builder: (context, state) {
        if (state is TheDogDetailLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TheDogDetailError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is TheDogDetailHasData) {
          final dog = state.result;
          return SafeArea(
              child: TheDogDetailPageContent(
            dog: dog,
          ));
        } else {
          return const Center(
            child: Text("Failed"),
          );
        }
      }),
    );
  }
}

class TheDogDetailPageContent extends StatelessWidget {
  final TheDog dog;
  bool _showSnackbar = false;

  TheDogDetailPageContent({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          dog.url.toString(),
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dog.breeds![0].name.toString(),
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Text(
                dog.breeds![0].breedGroup.toString(),
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('bred for : ${dog.breeds![0].bredFor}'),
              Text('life span : ${dog.breeds![0].lifeSpan}'),
              Text('temprament : ${dog.breeds![0].temperament}'),
              Text('width : ${dog.width} incies'),
              Text('height : ${dog.height} incies'),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  context
                      .read<TheDogFavBloc>()
                      .add(OnPostTheDogFavEvent(dog.id.toString()));
                },
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.heart_circle,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Make this fav list"),
                  ],
                ),
              ),
              BlocListener<TheDogFavBloc, TheDogFavState>(
                listener: (context, state) {
                  if (state is TheDogPostFavSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Added to favorites!'),
                      ),
                    );
                  } else if (state is TheDogFavError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Failed to add to favorites'),
                      ),
                    );
                  }
                },
                child: SizedBox.shrink(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
