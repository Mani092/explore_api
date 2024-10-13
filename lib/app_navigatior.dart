import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_bloc/bloc/nav_cubit.dart';
import 'package:pokedex_bloc/pokemon_details_view.dart';
import 'package:pokedex_bloc/pokemon_view.dart';

class AppNavi extends StatelessWidget {
  const AppNavi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit,int?>(builder: (context,pokemonId){
      return Navigator(
        pages: [
          MaterialPage(child: PokemonViewPage()),
          if(pokemonId!=null) MaterialPage(child: PokemonDetailsView()),
        ],
        onPopPage:  (route,result){
          BlocProvider.of<NavCubit>(context).popToPokedex();
          return route.didPop(result);
        },
      );
    });
  }
}
