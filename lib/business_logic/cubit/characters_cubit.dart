import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:learn_bloc_with_api/data/model/character.dart';
import 'package:learn_bloc_with_api/data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {

  CharactersRepository charactersRepository;
  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacter().then((characters){
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }
}
