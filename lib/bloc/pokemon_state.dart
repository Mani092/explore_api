import '../data/pokemon_reponse.dart';

abstract class PokemonState{}

class PokemonInitial extends PokemonState{}

class PokemonLoading  extends PokemonState{}

class PokemonPageLoaded extends PokemonState{
  final List<PokemonListing> pokeminListing;
  final bool  canLoadNextPage;

  PokemonPageLoaded({required this.pokeminListing,required this.canLoadNextPage});

}
class PokemonPageFailed extends PokemonState{
  final Error err;
  PokemonPageFailed({required this.err});
}