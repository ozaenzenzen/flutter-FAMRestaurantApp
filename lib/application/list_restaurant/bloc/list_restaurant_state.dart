part of 'list_restaurant_bloc.dart';

@immutable
abstract class ListRestaurantState {}

class ListRestaurantInitial extends ListRestaurantState {}

class ListRestaurantLoading2 extends ListRestaurantState {}

class ListRestaurantLoading extends ListRestaurantState {}

class ListRestaurantError extends ListRestaurantState {
  final String errorMessage;
  ListRestaurantError(this.errorMessage);
}

class ListRestaurantGetSuccess extends ListRestaurantState {
  final ListRestaurantResponse listRestaurantResponse;
  ListRestaurantGetSuccess(this.listRestaurantResponse);
}

class ListRestaurantSearchSuccess extends ListRestaurantState {
  final SearchRestaurantResponse searchRestaurantResponse;
  ListRestaurantSearchSuccess(this.searchRestaurantResponse);
}
