import 'package:flutter/material.dart';

class TheDogDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail-dog';

  final int id;

  TheDogDetailPage({super.key, required this.id});

  @override
  State<TheDogDetailPage> createState() => _TheDogDetailPageState();
}

class _TheDogDetailPageState extends State<TheDogDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
