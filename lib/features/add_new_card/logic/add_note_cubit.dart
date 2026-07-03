
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/card_model.dart';
import '../data/repo/add_card_repo.dart';

import 'add_note_state.dart';

class AddCardCubit extends Cubit<AddCardState> {
  final AddCardRepository _addCardRepository;

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