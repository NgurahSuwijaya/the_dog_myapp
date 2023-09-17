import 'package:flutter/material.dart';
import 'package:the_dog_myapp/data/models/the_dog_local.dart';

import '../pages/home/the_dog_detail_page.dart';

class DogCard extends StatelessWidget {
  final TheDogLocal dog;

  const DogCard({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, TheDogDetailPage.ROUTE_NAME,
            arguments: dog.dogId);
      },
      child: Card(
        child: Column(
          children: [
            Image.network(
              dog.url.toString(),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            ListTile(
              title: Text(dog.name.toString()),
              subtitle: Text(dog.breedGroup.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
