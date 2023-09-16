import 'package:flutter/material.dart';
import 'package:the_dog_myapp/presentation/pages/bloc/the_dogs/the_dogs_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_dog_myapp/presentation/widget/dog_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TheDogsBloc>().add(OnTheDogsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The Dog My App"),
      ),
      body: BlocBuilder<TheDogsBloc, TheDogsState>(builder: (context, state) {
        if (state is TheDogsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TheDogsEmpty) {
          return const Text("Data is empty");
        } else if (state is TheDogsError) {
          return Text(state.message);
        } else if (state is TheDogsHasData) {
          return ListView.builder(
              itemCount: state.result.length,
              itemBuilder: (context, index) {
                return DogCard(dog: state.result[index]);
              });
        } else {
          return const Text("Failed");
        }
      }),
    );
  }
}
