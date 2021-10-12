import 'package:bloc/bloc.dart';
import 'package:flutter_fam_ui7/domain/list_restaurant_response.dart';
import 'package:flutter_fam_ui7/domain/search_restaurant_response.dart';
import 'package:flutter_fam_ui7/repository/restaurant_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'list_restaurant_event.dart';
part 'list_restaurant_state.dart';

class ListRestaurantBloc
    extends Bloc<ListRestaurantEvent, ListRestaurantState> {
  ListRestaurantBloc() : super(ListRestaurantInitial());

  RestaurantRepository restaurantRepository = RestaurantRepository();

  @override
  Stream<ListRestaurantState> mapEventToState(
      ListRestaurantEvent event) async* {
    print("Coming event: $event");

    if (event is ListRestaurantShowListEvent) {
      yield ListRestaurantLoading();
      try {
        // final _data = await restaurantRepository.getDataListRestaurant();
        final _data =
            await restaurantRepository.getDataListRestaurant2().onError(
                  (error, stackTrace) => ListRestaurantError(error.toString()),
                );

        // print("Data keluar: $_data");
        // print("Data keluar: $_data");

        yield ListRestaurantGetSuccess(_data);

        // _data.fold(
        //   (l) async* {
        //     yield ListRestaurantError(l.toString());
        //   },
        //   (r) async* {
        //     yield ListRestaurantGetSuccess(r);
        //   },
        // );

      } catch (e) {
        yield ListRestaurantError(e.toString());
      }
    } else if (event is ListRestaurantSearchListEvent) {
      yield ListRestaurantLoading();
      try {
        final _datax = await restaurantRepository
            .searchDataListRestaurant(event.name)
            .onError(
              (error, stackTrace) => ListRestaurantError(error.toString()),
            );

        yield ListRestaurantSearchSuccess(_datax);
      } catch (e) {
        yield ListRestaurantError(e.toString());
      }
    }
  }
}
