import 'package:flutter/material.dart';

import '../../domain/entities/the_dog.dart';

class DogCard extends StatelessWidget {
  final TheDog dog;

  const DogCard({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            'a',
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text(dog.breeds![0].name.toString()),
            subtitle: Text(dog.breeds![0].breedGroup.toString()),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bred For: ${dog.breeds![0].bredFor}'),
                Text('Width: ${dog.width} inches'),
                Text('Height: ${dog.height} inches'),
                Text('Temperament: ${dog.breeds![0].temperament}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
