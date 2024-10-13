class PokemonSpeciesInfoRespo{
  final String desc;
  PokemonSpeciesInfoRespo({required this.desc});

  factory PokemonSpeciesInfoRespo.fromJson(Map<String,dynamic>json){
    return PokemonSpeciesInfoRespo(
        desc: json['flavor_text_entries'][0]['flavor_text']
    );
  }
}