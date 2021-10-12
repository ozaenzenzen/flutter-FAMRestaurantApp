import 'package:bloc/bloc.dart';
import 'package:flutter_fam_ui7/domain/list_restaurant_response.dart';
import 'package:flutter_fam_ui7/domain/search_restaurant_response.dart';
import 'package:flutter_fam_ui7/repository/restaurant_repository.dart';
import 'package:meta/meta.dart';

part 'list_restaurant_event.dart';
part 'list_restaurant_state.dart';

class ListRestaurantBloc
    extends Bloc<ListRestaurantEvent, ListRestaurantState> {
  ListRestaurantBloc() : super(ListRestaurantInitial());

  RestaurantRepository restaurantRepository = RestaurantRepository();

  @override
  Stream<ListRestaurantState> mapEventToState(
      ListRestaurantEvent event) async* {

    if (event is ListRestaurantShowListEvent) {
      yield* mapShowListEventToState();
    } else if (event is ListRestaurantSearchListEvent) {
      yield* mapSearchEventToState(event);
    }
  }

  Stream<ListRestaurantState> mapShowListEventToState() async* {
    yield ListRestaurantLoading();
    try {
      final _data = await restaurantRepository.getDataListRestaurant();

      yield* _data.fold(
        (l) async* {
          yield ListRestaurantError(l.toString());
        },
        (r) async* {
          yield ListRestaurantGetSuccess(r);
        },
      );
    } catch (e) {
      yield ListRestaurantError(e.toString());
    }
  }

  Stream<ListRestaurantState> mapSearchEventToState(
      ListRestaurantSearchListEvent event) async* {
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
