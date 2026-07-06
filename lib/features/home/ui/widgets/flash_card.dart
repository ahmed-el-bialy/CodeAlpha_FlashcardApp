import 'package:code_alpha_flash_card_app/core/models/card_model.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'card_face.dart';

class FlashCard extends StatelessWidget {
  final CardModel cardModel;
  final bool isInQuiz;

  const FlashCard({
    super.key,
    required this.cardModel,
    required this.isInQuiz,
  });

  @override
  Widget build(BuildContext context) {
    final double cardHeight = 220.h;

    return FlipCard(
      key: ValueKey('flashcard_${cardModel.id}'),
      direction: FlipDirection.HORIZONTAL,
      side: CardSide.FRONT,
      speed: 400,
      front: CardFace(
        cardHeight: cardHeight,
        cardModel: cardModel,
        isInQuiz: isInQuiz,
        isFront: true,
      ),
      back: CardFace(
        cardHeight: cardHeight,
        cardModel: cardModel,
        isInQuiz: isInQuiz,
        isFront: false,
      ),
    );
  }
}
