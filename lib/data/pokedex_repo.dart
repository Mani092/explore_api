import 'dart:convert';

import'package:http/http.dart' as http;
import 'package:pokedex_bloc/data/pokemon_info_response.dart';
import 'package:pokedex_bloc/data/pokemon_reponse.dart';
import 'package:pokedex_bloc/data/pokemon_species_info_response.dart';

class PokeDexRepo{
  final basUrl='pokeapi.co';
  final client=http.Client();

  Future<PokemonResponse> getPokemonPage(int pageIndex) async{
    final parameters={
      'limit':'200',
      'offset':(pageIndex*200).toString(),

    };
    final uri=Uri.https(basUrl,'/api/v2/pokemon',parameters);
    final response=await client.get(uri);
    final json =jsonDecode(response.body);

    return PokemonResponse.fromJson(json);
  }
  Future<PokemonInfoRespo?> getPokemonInfo(int pokemonId)async{
    final uri=Uri.https(basUrl,'/api/v2/pokemon/$pokemonId');
    try{
      final response=await client.get(uri);
      final json =jsonDecode(response.body);
      return PokemonInfoRespo.fromJson(json);
    }catch(e){
      print(e);
    }
  }

  Future<PokemonSpeciesInfoRespo?> getPokemonSpeciesInfo(int pokemonId)async{
    final uri=Uri.https(basUrl,'/api/v2/pokemon-species/$pokemonId');


    try{
     final response=await client.get(uri);
        final json =jsonDecode(response.body);
        return PokemonSpeciesInfoRespo.fromJson(json);
    }catch(e){
      print(e);
    }
  }
}