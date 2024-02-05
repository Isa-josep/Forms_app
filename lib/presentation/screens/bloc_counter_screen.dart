import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) { 
        return CounterBloc();
       },
      child: const BlocCounterView()
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void incrementCounterBy(BuildContext context,[ int value = 1]) {
    context.read<CounterBloc>()
    .add(CounterIncreased(value));
  }


  // 7 21 14 42 28

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Bloc Counter"),
        actions: [
          IconButton(
            onPressed: ()=> context.read<CounterBloc>().add(CounterReset()),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body:  Center(
        child: context.select((CounterBloc counterBloc) => Text("Counter value: ${counterBloc.state.counter}")),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "1",
            onPressed: (){
              incrementCounterBy(context, 3);
            },
            child: const Text("+3"),
          ),
          const SizedBox(height: 10,),
          FloatingActionButton(
            heroTag: "2",
            onPressed: (){
              incrementCounterBy(context, 2);
            },
            child: const Text("+2"),
          ),
          const SizedBox(height: 10,),
          FloatingActionButton(
            heroTag: "3",
            onPressed: (){
              incrementCounterBy(context);
            },
            child: const Text("+1"),
          ),
        ],
      )
    );
  }
}