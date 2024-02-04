part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  final int trasnsactionCount;
  const CounterState({
    this.counter =10, 
    this.trasnsactionCount=0
  });

  CounterState copyWith({
    int? counter,
    int? trasnsactionCount,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      trasnsactionCount: trasnsactionCount ?? this.trasnsactionCount,
    );
  }
  
  @override
  List<Object> get props => [counter, trasnsactionCount];
}
