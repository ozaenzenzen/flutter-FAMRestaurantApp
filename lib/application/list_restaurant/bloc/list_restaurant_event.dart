part of 'list_restaurant_bloc.dart';

@immutable
abstract class ListRestaurantEvent {}

class ListRestaurantShowListEvent extends ListRestaurantEvent {}

class ListRestaurantSearchListEvent extends ListRestaurantEvent {
  final String name;
  ListRestaurantSearchListEvent(this.name);
}
