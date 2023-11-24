import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_food.dart';

class DetailScreen extends StatelessWidget {
  final RecipeFood recipe;
  const DetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(recipe.imagePoster),
                ),
                const SizedBox(height: 16),
                Text(recipe.name,
                    style:
                        const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                Text(recipe.type,
                    style: const TextStyle(fontSize: 22, color: Colors.grey)),
                const SizedBox(height: 8),
                Text(recipe.description, style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 32),
                const Text('Bahan-Bahan:',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: recipe.ingredients.map((ing) {
                    return Text('- $ing', style: const TextStyle(fontSize: 18));
                  }).toList(),
                ),
                const SizedBox(height: 16),
                const Text('Langkah-Langkah:',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: recipe.step.map((st) {
                    return Text(st, style: const TextStyle(fontSize: 18));
                  }).toList(),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: recipe.imageUrls.map((url) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(url),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
