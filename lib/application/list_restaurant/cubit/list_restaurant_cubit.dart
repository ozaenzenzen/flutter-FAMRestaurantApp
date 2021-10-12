import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_fam_ui7/domain/list_restaurant_response.dart';
import 'package:flutter_fam_ui7/domain/search_restaurant_response.dart';
import 'package:flutter_fam_ui7/repository/restaurant_repository.dart';

part 'list_restaurant_state.dart';

class ListRestaurantCubit extends Cubit<ListRestaurantState> {
  ListRestaurantCubit() : super(ListRestaurantInitial());

  RestaurantRepository restaurantRepository = RestaurantRepository();

  void getListDataRestaurant() async {
    emit(ListRestaurantLoading());
    try {
      final _data = await restaurantRepository.getDataListRestaurant2().onError(
            (error, stackTrace) => emit(ListRestaurantError(error.toString())),
          );

      emit(ListRestaurantGetSuccess(_data));
    } catch (e) {
      emit(ListRestaurantError(e.toString()));
    }
  }

  void searchListDataRestaurant(String name) async {
    print("Berhasil");
    emit(ListRestaurantLoading());
    try {
      final _data = await restaurantRepository.searchDataListRestaurant(name).onError(
            (error, stackTrace) => emit(ListRestaurantError(error.toString())),
          );

      emit(ListRestaurantSearchSuccess(_data));
    } catch (e) {
      emit(ListRestaurantError(e.toString()));
    }
  }
}
