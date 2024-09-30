import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_with_api/business_logic/cubit/characters_cubit.dart';
import 'package:learn_bloc_with_api/core/constants/colors.dart';
import 'package:learn_bloc_with_api/presentation/widget/character_item.dart';

import '../../data/model/character.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> characters;

  @override
  void initState() {
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
    super.initState();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit,CharactersState>(
        builder: (context,state) {
          if(state is CharactersLoaded){
            characters = (state).characters;
            return buildLoadedListWidget();
          }else {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.yellow,
              ),
            );
          }
        }
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: AppColor.grey,
        child: Column(
          children: [
            buildCharactersList()
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:2,
        childAspectRatio: 2/3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: characters.length,
      itemBuilder: (context, index) =>
          CharacterItem(character: characters[index])
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("characters"),
      ),
      body: buildBlocWidget(),
    );
  }
}

