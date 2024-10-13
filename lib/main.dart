import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_bloc/app_navigatior.dart';
import 'package:pokedex_bloc/bloc/nav_cubit.dart';
import 'package:pokedex_bloc/bloc/pokemon_bloc.dart';
import 'package:pokedex_bloc/bloc/pokemon_deatils_cubit.dart';
import 'package:pokedex_bloc/bloc/pokemon_event.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final pokemonDetailsCubit=PokemonDetailsCubit();
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>PokemonBloc()..add(PokemonPageRequest(page: 0))),
          BlocProvider(create: (context)=> NavCubit(pokemonDetailsCubit: pokemonDetailsCubit)),
          BlocProvider(create: (context)=>pokemonDetailsCubit),
        ],
          child: AppNavi(),
      ),
    );
  }
}

