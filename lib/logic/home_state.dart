part of 'home_bloc.dart';

 class HomeState {
  final bool isApiFetching;
  final String? result;

  const HomeState({required this.isApiFetching, this.result});
}

class HomeInitial extends HomeState {
  HomeInitial({required super.isApiFetching});
}
