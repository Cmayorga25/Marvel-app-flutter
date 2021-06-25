import 'package:examen_tendencias/models/hero_model.dart';
import 'package:flutter/material.dart';

class HeroDetalle extends StatefulWidget {
  @override
  _HeroDetalle createState() => _HeroDetalle();
}

class _HeroDetalle extends State<HeroDetalle> {
  @override
  Widget build(BuildContext context) {
    final Recipe hero = ModalRoute.of(context).settings.arguments;
    print(hero);
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _crearAppBar(hero),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: 10.0,
            ),
            _posterTitulo(hero, context),
            _descripcion(hero),
          ]),
        )
      ],
    ));
  }

  Widget _crearAppBar(Recipe hero) {
    return SliverAppBar(
      elevation: 5.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          hero.name,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
          overflow: TextOverflow.ellipsis,
        ),
        background: FadeInImage(
          image: NetworkImage(hero.images),
          placeholder: AssetImage(''),
          fadeInDuration: Duration(microseconds: 1000),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitulo(Recipe hero, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20.0),
      child: Row(
        children: [
          Hero(
            tag: hero.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(hero.images),
                height: 150.0,
              ),
            ),
          ),
          SizedBox(width: 20.0),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(width: 7),
                  Text(
                    'Comics: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    hero.totalComics.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                  ),
                  Text(
                    'Series: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    hero.totalSeries.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }

  Widget _descripcion(Recipe hero) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Text(
        hero.description,
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }
}
