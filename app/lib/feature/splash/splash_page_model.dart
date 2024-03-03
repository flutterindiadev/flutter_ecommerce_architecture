import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../utils/request_manager.dart';

@injectable
class SplashViewModel extends BasePageViewModel {
  final String myBaseUrl;
  final StreamController<bool> _navigateToDashboardController =
      StreamController();
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  final GetLocationUsecase getLocationUsecase;

  final RequestLocationPermissionUsecase requestLocationPermissionUsecase;

  late Timer future;

  SplashViewModel(@factoryParam this.myBaseUrl, this.exceptionHandlerBinder,
      this.getLocationUsecase, this.requestLocationPermissionUsecase) {
    future = Timer(const Duration(seconds: 2), () async {
      _navigateToDashboardController.sink.add(true);
      _navigateToDashboardController.close();
    });
  }

  Stream<bool> navigateToDashboard() => _navigateToDashboardController.stream;

  void test() {
    exceptionHandlerBinder.handle(block: () {
      debugPrint("exceptionHandlerBinder start");
      throw const FormatException("Something is wrong");
      /* throw NetworkError(
          httpError: 1,
          message: "message Testing another error",
          cause: Exception("Testing another error"));*/
      /*var name = await Future.delayed(
        const Duration(seconds: 2),
        () => //"my name",
            throw const FormatException("sad"),
      );*/
      //print("name >> $name");
    }).execute();

/*
    exceptionHandlerBinder.handle(block: () {
      // serverRequest(); // Some dangerous code that can throw an exception
    }).finallyIt(block: () {
      // Optional finally block
      // Some code
    }).execute();
*/

    /* exceptionHandlerBinder.handle(block: () {
      // serverRequest(); // Some dangerous code that can throw an exception
    }).catchIt<FormatException>((e) {
      // Optional finally block
      // Some code
      return false;
    }).execute();*/
  }

  @override
  void dispose() {
    future.cancel();
    _navigateToDashboardController.close();
    super.dispose();
  }

  void getLocation() {
    exceptionHandlerBinder.handle(block: () {
      print("exceptionHandlerBinder start");
      GetLocationUsecaseParams getLocationUsecaseParams =
          GetLocationUsecaseParams();

      RequestManager<Location>(getLocationUsecaseParams,
              createCall: () =>
                  getLocationUsecase.execute(params: getLocationUsecaseParams))
          .asFlow()
          .listen((event) {
        debugPrint('Latitude =====>' "${event.data?.lattitude}");
      });
    }).execute();
  }

  void getLocationPermission() {
    exceptionHandlerBinder.handle(block: () {
      print("exceptionHandlerBinder start");
      RequestLocationPermissionUsecaseParams
          requestLocationPermissionUsecaseParams =
          RequestLocationPermissionUsecaseParams();

      RequestManager<AppPermission>(requestLocationPermissionUsecaseParams,
              createCall: () => requestLocationPermissionUsecase.execute(
                  params: requestLocationPermissionUsecaseParams))
          .asFlow()
          .listen((event) {
        debugPrint(
            "Location Permission Granted=====> ${event.data?.isLocationPermissionGranted}");
      });
    }).execute();
  }
}
