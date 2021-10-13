// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_fam_ui7/domain/detail_restaurant_response.dart';
import 'package:flutter_fam_ui7/domain/list_restaurant_response.dart';
import 'package:flutter_fam_ui7/domain/search_restaurant_response.dart';
import 'package:flutter_fam_ui7/urls/urls.dart';
import 'package:get_storage/get_storage.dart';

class RestaurantRepository {
  final Dio _dio = Dio();
  final userData = GetStorage();

  Future getDataListRestaurant2() async {
    Response _response;
    _response = await _dio.get(
      Urls.LIST_RESTAURANT,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    ListRestaurantResponse _listRestaurantResponse =
        ListRestaurantResponse.fromJson(_response.data);
    return _listRestaurantResponse;
  }

  Future<Either<String, ListRestaurantResponse>> getDataListRestaurant() async {
    Response _response;

    try {
      _response = await _dio.get(
        Urls.LIST_RESTAURANT,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      ListRestaurantResponse _listRestaurantResponse =
          ListRestaurantResponse.fromJson(_response.data);

      return right(_listRestaurantResponse);
    } on DioError catch (e) {
      print(e.response!.statusCode);

      String errorMessage = e.response!.data.toString();

      switch (e.type) {
        case DioErrorType.connectTimeout:
          break;
        case DioErrorType.sendTimeout:
          break;
        case DioErrorType.receiveTimeout:
          break;
        case DioErrorType.response:
          errorMessage = e.response!.data['message'];
          break;
        case DioErrorType.cancel:
          break;
        case DioErrorType.other:
          break;
      }

      return left(errorMessage);
    }
  }

  Future getDataDetailRestaurant2(String id) async {
    Response _response;

    _response = await _dio.get(
      Urls.DETAIL_RESTAURANT + "/" + id,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    DetailRestaurantResponse _detailRestaurantResponse =
        DetailRestaurantResponse.fromJson(_response.data);

    return _detailRestaurantResponse;
  }

  Future<Either<String, DetailRestaurantResponse>> getDataDetailRestaurant(
      String id) async {
    Response _response;
    try {
      _response = await _dio.get(
        Urls.DETAIL_RESTAURANT + "/" + id,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      DetailRestaurantResponse _detailRestaurantResponse =
          DetailRestaurantResponse.fromJson(_response.data);

      return right(_detailRestaurantResponse);
    } on DioError catch (e) {
      print(e.response!.statusCode);

      String errorMessage = e.response!.data.toString();

      switch (e.type) {
        case DioErrorType.connectTimeout:
          break;
        case DioErrorType.sendTimeout:
          break;
        case DioErrorType.receiveTimeout:
          break;
        case DioErrorType.response:
          errorMessage = e.response!.data['message'];
          break;
        case DioErrorType.cancel:
          break;
        case DioErrorType.other:
          break;
      }

      return left(errorMessage);
    }
  }

  Future searchDataListRestaurant(String name) async {
    Response _response;

    _response = await _dio.get(
      Urls.SEARCH_RESTAURANT + name,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    
    SearchRestaurantResponse _searchRestaurantResponse = SearchRestaurantResponse.fromJson(_response.data);
    return _searchRestaurantResponse;
  }
}
