import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_bloc/bloc/nav_cubit.dart';
import 'package:pokedex_bloc/bloc/pokemon_bloc.dart';
import 'package:pokedex_bloc/bloc/pokemon_state.dart';

class PokemonViewPage extends StatelessWidget {
  const PokemonViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.redAccent,
          title: Center(
            child: Text("PokeDex",
            ),
          ),
        ),
        body: BlocBuilder<PokemonBloc,PokemonState>(
          builder: (context,state){
            if(state is PokemonLoading){
              return Center(child: CircularProgressIndicator());
            }else if(state is PokemonPageLoaded){
              return GridView.builder(
                itemCount: state.pokeminListing.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: ()=> BlocProvider.of<NavCubit>(context).showPokemonDetails(state.pokeminListing[index].id),
                      child: Card(
                        child: GridTile(
                          child: Column(
                            children: [
                              Image.network(state.pokeminListing[index].Imageurl),
                              Text(state.pokeminListing[index].name),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              );
            }else if(state is PokemonPageFailed){
              return Center(
                child: Text(state.err.toString()),
              );
            }else{
              return Container();
            }
          }
        ),
      ),
    );
  }
}
