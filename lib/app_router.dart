import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_with_api/business_logic/cubit/characters_cubit.dart';
import 'package:learn_bloc_with_api/core/constants/screen_routes.dart';
import 'package:learn_bloc_with_api/data/repository/characters_repository.dart';
import 'package:learn_bloc_with_api/data/web_services/characters_web_service.dart';
import 'package:learn_bloc_with_api/presentation/screen/characters_detail_screen.dart';
import 'package:learn_bloc_with_api/presentation/screen/characters_screen.dart';

class AppRouter {

  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebService());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings setting) {
    switch(setting.name) {
      case ScreenRoute.characterScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (BuildContext context) => charactersCubit,
              child: const CharactersScreen(),
            )
        );
      case ScreenRoute.characterDetailScreen:
        return MaterialPageRoute(builder: (_) => const CharactersDetailScreen());
    }
    return null;
  }
}