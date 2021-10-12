import 'package:bloc/bloc.dart';
import 'package:flutter_fam_ui7/domain/detail_restaurant_response.dart';
import 'package:flutter_fam_ui7/repository/restaurant_repository.dart';
import 'package:meta/meta.dart';

part 'detail_restaurant_event.dart';
part 'detail_restaurant_state.dart';

class DetailRestaurantBloc
    extends Bloc<DetailRestaurantEvent, DetailRestaurantState> {
  DetailRestaurantBloc() : super(DetailRestaurantInitial());

  RestaurantRepository restaurantRepository = RestaurantRepository();

  @override
  Stream<DetailRestaurantState> mapEventToState(
      DetailRestaurantEvent event) async* {
    if (event is DetailRestaurantShowDetailsEvent) {
      yield DetailRestaurantLoading();
      try {
        final _data =
            await restaurantRepository.getDataDetailRestaurant(event.id);

        yield* _data.fold(
          (l) async* {
            yield DetailRestaurantError(l.toString());
          },
          (r) async* {
            yield DetailRestaurantGetSuccess(r);
          },
        );
      } catch (e) {
        yield DetailRestaurantError(e.toString());
      }
    }
  }
}
