import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'modal_event.dart';
part 'modal_state.dart';

class ModalBloc extends Bloc<ModalEvent, ModalState> {
  ModalBloc() : super(ModalState()) {
    on<ModalEvent>((event, emit) {
      if(event is OpenModal){
        emit(ModalState(
          modalOpen: true
        ));
      }
      else if (event is CloseModal){
        emit(ModalState(
          modalOpen: false
        ));
      }
    });
  }
}
