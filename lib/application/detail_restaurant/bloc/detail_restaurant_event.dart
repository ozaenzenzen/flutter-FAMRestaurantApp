part of 'detail_restaurant_bloc.dart';

@immutable
abstract class DetailRestaurantEvent {}

class DetailRestaurantShowDetailsEvent extends DetailRestaurantEvent {
  final String id;
  DetailRestaurantShowDetailsEvent(this.id);
}
