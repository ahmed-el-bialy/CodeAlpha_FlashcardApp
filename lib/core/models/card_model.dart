class CardModel {
  final String id;
  final String? category;
  final String front;
  final String? hint;
  final String back;

  CardModel({
    required this.id,
    this.category,
    required this.front,
    this.hint,
    required this.back,
  });
}
