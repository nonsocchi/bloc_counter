import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Center(
            child: Text(
              '$count',
              style: const TextStyle(fontSize: 24.0),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomFAB(
            icon: Icons.add,
            onPressed: () =>
                context.read<CounterBloc>().add(CounterIncrementPressed()),
          ),
          CustomFAB(
            icon: Icons.remove,
            onPressed: () =>
                context.read<CounterBloc>().add(CounterDecrementPressed()),
          ),
        ],
      ),
    );
  }
}

class CustomFAB extends StatelessWidget {
  const CustomFAB({super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: FloatingActionButton(
        onPressed: onPressed,
        child: Icon(icon),
      ),
    );
  }
}
