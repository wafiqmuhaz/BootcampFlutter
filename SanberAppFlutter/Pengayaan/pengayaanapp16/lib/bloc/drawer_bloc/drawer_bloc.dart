import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'drawer_event.dart';
part 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc() : super(DrawerInitial()) {
    on<OpenDrawerEvent>((event, emit) {
      emit(DrawerOpen());
    });
    on<CloseDrawerEvent>((event, emit) {
      emit(DrawerClosed());
    });
  }
}