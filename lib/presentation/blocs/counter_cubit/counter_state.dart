part of 'counter_cubit.dart';


class CounterState extends Equatable{
  final int counter;
  final int trasactionCount;

  const CounterState({
     this.counter=0, 
     this.trasactionCount=0
  });

  copyWith({
      int? counter,
      int? trasactionCount,
  })=>CounterState(
    counter: counter??this.counter,
    trasactionCount: trasactionCount??this.trasactionCount
  );
  
  @override
 
  List<Object?> get props => [counter,trasactionCount];
  
}