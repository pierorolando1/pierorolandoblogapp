part of 'modal_bloc.dart';


class ModalState {
  bool modalOpen;

  ModalState({this.modalOpen = false});

  ModalState copyWith({bool? modalOpen}){
    return ModalState(
      modalOpen: modalOpen ?? this.modalOpen
    );
  }

}
