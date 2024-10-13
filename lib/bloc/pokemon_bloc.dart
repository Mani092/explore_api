

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_bloc/bloc/pokemon_event.dart';
import 'package:pokedex_bloc/bloc/pokemon_state.dart';

import '../data/pokedex_repo.dart';

class PokemonBloc extends Bloc<PokemonEvent,PokemonState>{
  final _pokemonRepo=PokeDexRepo();
  PokemonBloc(): super(PokemonInitial()){
    on<PokemonPageRequest>(
            (event,emit)async{
          emit(PokemonLoading());
          try{
            final pokemonPageResponse=await _pokemonRepo.getPokemonPage(event.page);
            emit(PokemonPageLoaded(
                pokeminListing: pokemonPageResponse.pokemonListing,
                canLoadNextPage: pokemonPageResponse.canLoadNextPage));
          }on Error catch(e){
            emit(PokemonPageFailed(err: e));
          }

        }
    );
  }
}