import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
   
  CounterBloc() : super(const CounterState()) {
    
    on<CounterEvent>(_onCounterIncreased);
    on<CounterReset>(onCounterReset);
  }


  void _onCounterIncreased(CounterEvent event,Emitter<CounterState> emit){
    emit(state.copyWith(
      counter: state.counter + (event as CounterIncreased).value!,  //state.counter + event.value!,
      trasnsactionCount: state.trasnsactionCount + 1, 
    ));

  
  }
  void onCounterReset(CounterReset event,Emitter<CounterState> emit){
    emit(state.copyWith(
      counter: 0,
    ));
  }
}
