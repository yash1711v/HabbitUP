import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'duration_event.dart';
part 'duration_state.dart';

class DurationBloc extends Bloc<DurationEvent, DurationState> {
  DurationBloc() : super(DurationInitial()) {
    on<DurationEvent>((event, emit) {
      if(event is SetTimeEvent){
        emit(SetTimeState(settingTime: event.settingTime,settingEndTime: event.settingEndTime));
      }
    });
  }
}
