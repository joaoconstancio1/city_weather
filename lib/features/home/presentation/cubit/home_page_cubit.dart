import 'package:city/features/home/data/models/city_model.dart';
import 'package:city/features/home/domain/entities/city_entity.dart';
import 'package:city/features/home/domain/repositories/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_states.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(
    this.repository,
  ) : super(const HomePageInitialState());

  final HomeRepository repository;

  Future<void> get() async {
    emit(const HomePageLoadingState());

    try {
      final result = await repository.get();
      result.fold((l) => emit(HomePageErrorState(l)),
          (r) => emit(HomePageSuccessState(cities: r)));
    } catch (error, stackTrace) {
      onError(error, stackTrace);
    }
  }
}