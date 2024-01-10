part of 'main_bloc.dart';

class MainState{
  Status? status;
  List<CurrencyModel>? list;

  MainState({ this.list, this.status});
  MainState copyWith(Status? status,List<CurrencyModel> newList) => MainState(status:status ?? this.status,list: list ?? this.list);
}


