import 'package:flutter/material.dart';
import 'package:learn_bloc_with_api/core/constants/colors.dart';
import 'package:learn_bloc_with_api/data/model/character.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    print("Ak2000YYYYY");
    print(character.images![0]);
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: GridTile(
          footer: Container(
            padding: const EdgeInsets.all(4),
            child: Text(character.name!, style:const TextStyle(color: AppColor.grey),),
          ),
          child: Container(
            color: AppColor.grey,
              child: character.images![0]!.isNotEmpty ?
              FadeInImage.assetNetwork(
                width: double.infinity,
                height: double.infinity,
                placeholder: "assets/images/loading.GIF",
                image: character.images![0]!,
                fit: BoxFit.cover,
              ) : Image.asset("assets/images/loading.GIF")
          ),
      )
    );
  }
}
