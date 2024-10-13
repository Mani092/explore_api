
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_bloc/bloc/pokemon_deatils_cubit.dart';

class NavCubit extends Cubit<int?> {
  PokemonDetailsCubit pokemonDetailsCubit;

  NavCubit({required this.pokemonDetailsCubit}) : super(null);

  void showPokemonDetails(int pokemonId) {
    print(pokemonId);
    pokemonDetailsCubit.getPokemonDeatils(pokemonId);
    emit(pokemonId);
  }

  void popToPokedex() {
    emit(null);
    pokemonDetailsCubit.clearPokemonDetails();
  }
}