import 'package:examen_tendencias/models/hero_model.dart';
import 'package:examen_tendencias/providers/recipe.provider.dart';
import 'package:flutter/material.dart';

class DataDelegate extends SearchDelegate {
  final recipeapi = new RecipeApi();

  String seleccion = '';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {},
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
        child: Container(
      height: 100.0,
      width: 150.0,
      color: Colors.blueAccent,
      child: Text(seleccion),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: recipeapi.searchHeroes(query),
      builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
        if (snapshot.hasData) {
          final hero = snapshot.data;
          return ListView(
            children: hero.map((hero) {
              return ListTile(
                leading: FadeInImage(
                    image: NetworkImage(hero.images),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    width: 50.0,
                    fit: BoxFit.contain),
                title: Text(hero.name),
                onTap: () {
                  close(context, null);
                  Navigator.pushNamed(context, 'detalle', arguments: hero);
                },
              );
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
