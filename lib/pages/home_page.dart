import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api using flutter bloc'),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if(state.isApiFetching){
            return Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            );
          }
          return Center(
              child: Text(
            state.result??"NO DATA",
            style: TextStyle(fontSize: 40),
          ));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<HomeBloc>().add(FetchApiEvent());
        },
        label: Text('Fetch Api'),
      ),
    );
  }
}
