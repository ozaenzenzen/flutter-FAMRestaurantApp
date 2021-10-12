part of 'list_restaurant_bloc.dart';

@immutable
abstract class ListRestaurantState extends Equatable{}

class ListRestaurantInitial extends ListRestaurantState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ListRestaurantLoading2 extends ListRestaurantState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ListRestaurantLoading extends ListRestaurantState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ListRestaurantSuccess extends ListRestaurantState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ListRestaurantError extends ListRestaurantState {
  final String errorMessage;
  ListRestaurantError(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}

class ListRestaurantGetSuccess extends ListRestaurantState {
  final ListRestaurantResponse listRestaurantResponse;
  ListRestaurantGetSuccess(this.listRestaurantResponse);

  @override
  // TODO: implement props
  List<Object?> get props => [listRestaurantResponse];
}

class ListRestaurantSearchSuccess extends ListRestaurantState {
  final SearchRestaurantResponse searchRestaurantResponse;
  ListRestaurantSearchSuccess(this.searchRestaurantResponse);

  @override
  // TODO: implement props
  List<Object?> get props => [searchRestaurantResponse];
}
