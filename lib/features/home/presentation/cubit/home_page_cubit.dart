import 'package:city/core/core_extensions.dart';
import 'package:city/features/home/domain/repositories/home_repository.dart';
import 'package:city/features/home/presentation/cubit/home_page_states.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(
    this.repository,
  ) : super(const HomePageInitialState());

  final HomeRepository repository;

  Future<void> init() async {
    emit(const HomePageLoadingState());

    try {
      final result = await repository.get();
      result.fold((l) => emit(HomePageErrorState(l)),
          (r) => emit(HomePageSuccessState(cities: r)));
    } catch (error) {
      emit(HomePageErrorState(Exception(error)));
    }
  }

  Future<void> addCity() async {
    emit(const HomePageLoadingState());

    try {
      await repository.addCity();
      await init();
    } catch (error) {
      emit(HomePageErrorState(Exception(error)));
    }
  }

  Future<void> deleteCity(String id) async {
    emit(const HomePageLoadingState());

    try {
      await repository.deleteCity(id);
      await init();
    } catch (error) {
      emit(HomePageErrorState(Exception(error)));
    }
  }

  Future<void> updateCity({
    String? id,
    String? cityName,
    String? temperature,
    String? description,
  }) async {
    try {
      await repository.updateCity(
          id: id,
          cityName: cityName,
          temperature: temperature,
          description: description);
    } catch (error) {
      emit(HomePageErrorState(Exception(error)));
    }
  }

  Future<void> createCity({
    String? id,
    String? cityName,
    String? temperature,
    String? description,
  }) async {
    try {
      await repository.createCity(
          id: id,
          cityName: cityName,
          temperature: temperature,
          description: description);
    } catch (error) {
      emit(HomePageErrorState(Exception(error)));
    }
  }
}
