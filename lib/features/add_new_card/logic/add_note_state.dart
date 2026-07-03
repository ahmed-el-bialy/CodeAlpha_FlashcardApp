abstract class AddCardState {}

class AddCardInitial extends AddCardState {}

class AddCardLoading extends AddCardState {}

class AddCardSuccess extends AddCardState {}

class AddCardError extends AddCardState {
  final String error;

  AddCardError({required this.error});
}
