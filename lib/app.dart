import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/bloc/coin/coin_bloc.dart';
import 'view/screens/home.dart';

class CoinWatch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coin Watch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark
      ),
      home: BlocProvider<CoinBloc>(
          create: (context) => CoinBloc(),
          child: HomeScreen()
      ),
    );
  }
}