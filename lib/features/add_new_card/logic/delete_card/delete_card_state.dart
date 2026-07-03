abstract class DeleteCardState {}

class DeleteCardInitial extends DeleteCardState {}

class DeleteCardLoading extends DeleteCardState {}

class DeleteCardSuccess extends DeleteCardState {}

class DeleteCardError extends DeleteCardState {
  final String error;

  DeleteCardError({required this.error});
}
