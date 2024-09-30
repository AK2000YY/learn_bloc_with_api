import 'package:learn_bloc_with_api/data/model/character.dart';
import 'package:learn_bloc_with_api/data/web_services/characters_web_service.dart';


class CharactersRepository {

  CharactersWebService charactersWebService;

  CharactersRepository(this.charactersWebService);

  Future<List<Character>> getAllCharacter() async {
    final characters = await charactersWebService.getAllCharacter();
    return characters.map((character) => Character.fromJson(character)).toList() ;
  }

}