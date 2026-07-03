import 'package:hive/hive.dart';
import '../../../../core/models/card_model.dart';

class AddCardRepository {
  static const String _boxName = 'flash_cards_box';

  Future<void> saveCard(CardModel card) async {

    final box = await Hive.openBox<CardModel>(_boxName);
    await box.put(card.id, card);
  }

  Future<List<CardModel>> getAllCards() async {
    final box = await Hive.openBox<CardModel>(_boxName);
    return box.values.toList();
  }

  Future<void> deleteCard(String cardId) async {
    final box = await Hive.openBox<CardModel>(_boxName);
    await box.delete(cardId);
  }
}