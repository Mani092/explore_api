import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_bloc/data/pokedex_repo.dart';
import 'package:pokedex_bloc/data/pokemon_details.dart';
import 'package:pokedex_bloc/data/pokemon_info_response.dart';
import 'package:pokedex_bloc/data/pokemon_species_info_response.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails?>{
 final _pokemonRepo=PokeDexRepo();
  PokemonDetailsCubit (): super(null);

  void getPokemonDeatils(int pokemonId)async{
    final response=await Future.wait([
      _pokemonRepo.getPokemonInfo(pokemonId),
    _pokemonRepo.getPokemonSpeciesInfo(pokemonId),
    ]);

    final pokemonInfo =response[0] as PokemonInfoRespo;
    final speciesInfo=response[1] as PokemonSpeciesInfoRespo;
    
    emit(PokemonDetails(
        id: pokemonInfo.id,
        name: pokemonInfo.name,
        imageUrl: pokemonInfo.imageUrl,
        types: pokemonInfo.types,
        height: pokemonInfo.height,
        weight: pokemonInfo.weight,
        description: speciesInfo.desc));
  }
  void clearPokemonDetails()=>emit(null);

}