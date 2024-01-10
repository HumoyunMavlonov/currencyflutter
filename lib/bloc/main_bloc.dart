import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:currencyflutter/data/remote/currency_api.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../data/model/currency_model.dart';
import '../data/status.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {

    on<MainEvent>((event, emit) async {

         emit(MainState(status: Status.LOADING));
        try {
          print("ssssssss");

          final res = await ApiServiceImpl().getCurrency();


          emit(MainState(list: res, status: Status.SUCCESS));

          print(res.length);
          print("object");
        } catch (e) {
          print("Error: $e");
          emit(MainState(status: Status.ERROR));
        }
    });
  }
}
