import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String id;
  final String title;
  const CategoryMealsScreen({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text(
          'The recipes for the category',
        ),
      ),
    );
  }
}
