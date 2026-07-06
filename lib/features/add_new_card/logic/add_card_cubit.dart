
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/models/card_model.dart';
import '../../../core/data/repo/cards_repo.dart';

import 'add_card_state.dart';

class AddCardCubit extends Cubit<AddCardState> {
  final CardsRepo _addCardRepository;

  AddCardCubit(this._addCardRepository) : super(AddCardInitial());


  Future<void> emitSaveCard(CardModel card) async {
    emit(AddCardLoading());
    try {
      await _addCardRepository.saveCard(card);
      emit(AddCardSuccess());
    } catch (e) {
      emit(AddCardError(error: e.toString()));
    }
  }


}