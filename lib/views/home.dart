import 'package:examen_tendencias/search/search_delegate.dart';
import 'package:examen_tendencias/views/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:examen_tendencias/providers/recipe.provider.dart';
import 'package:examen_tendencias/models/hero_model.dart';
import 'package:examen_tendencias/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            // title: Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Icon(Icons.data_usage_outlined),
            //     SizedBox(width: 10),
            //     Text('Héroes'),
            //   ],
            // ),
            title: Text('Héroes'),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: DataDelegate());
                },
              )
            ]),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(hero: _recipes[index]);
                  // thumbnailUrl: _recipes[index].images);
                },
              ));
  }
}
