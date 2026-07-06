abstract class EditCardState {}

class EditCardInitial extends EditCardState {}

class EditCardLoading extends EditCardState {}

class EditCardSuccess extends EditCardState {}

class EditCardError extends EditCardState {
  final String error;

  EditCardError({required this.error});
}
