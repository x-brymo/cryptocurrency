
import 'package:bloc/bloc.dart';
import 'package:cryptocurrency/src/features/infrastructure/blocs/sliderbar/index.dart';

class SidebarBloc extends Bloc<SidebarEvent, SidebarState> {
  SidebarBloc() : super(InitialSidebarState()) {
    on<SidebarEvent>((event, emit) {
      if (event is ChangeScreenEvent) {
        changeScreen(event.index);
      }
    });
  }

  void changeScreen(int index) => emit(SidebarStateChanged(index: index));

}
