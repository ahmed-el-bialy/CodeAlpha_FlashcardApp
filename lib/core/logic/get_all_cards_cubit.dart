import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/repo/cards_repo.dart';
import 'get_all_cards_state.dart';

class GetAllCardsCubit extends Cubit<GetAllCardsState> {
  final CardsRepo _cardsRepo;

  GetAllCardsCubit(this._cardsRepo) : super(CardsInitial());

  Future<void> fetchAllCards() async {
    emit(CardsLoading());
    try {
      final cards = await _cardsRepo.getAllCards();
      emit(CardsLoadedSuccess(cards));
    } catch (e) {
      emit(CardsError('there was an Error: ${e.toString()}'));
    }
  }
}
