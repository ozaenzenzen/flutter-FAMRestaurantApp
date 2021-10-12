part of 'detail_restaurant_bloc.dart';

@immutable
abstract class DetailRestaurantState {}

class DetailRestaurantInitial extends DetailRestaurantState {}

class DetailRestaurantLoading extends DetailRestaurantState {}

class DetailRestaurantError extends DetailRestaurantState {
  final String errorMessage;
  DetailRestaurantError(this.errorMessage);
}

class DetailRestaurantGetSuccess extends DetailRestaurantState {
  final DetailRestaurantResponse detailRestaurantResponse;
  DetailRestaurantGetSuccess(this.detailRestaurantResponse);
}
