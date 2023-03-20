import 'package:api_using_bloc/repository/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial(isApiFetching: false)) {
    on<FetchApiEvent>((event, emit) async{
      emit(HomeState(isApiFetching: true));
      final data = await HomeRepository.fetchRandomAPI();
      emit(HomeState(isApiFetching: false,result: data));
    });
  }
}
