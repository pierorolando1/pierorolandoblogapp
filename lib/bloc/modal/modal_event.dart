part of 'modal_bloc.dart';

@immutable
abstract class ModalEvent {}

class CloseModal extends ModalEvent {}

class OpenModal extends ModalEvent {}