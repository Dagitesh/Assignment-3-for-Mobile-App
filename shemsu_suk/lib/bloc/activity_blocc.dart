import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:shemsu_suk/model/item.dart';

import '../Service/apiService.dart';
import 'activity_event.dart';
import 'activity_state.dart';

class itemBloc extends Bloc<itemEvent, itemState> {
  final _apiServiceProvider = ApiServiceProvider();
  List purchaseHistory = [];
  itemBloc() : super(itemInitialState()) {
    on<GetDataButtonPressed>((event, emit) async {
      emit(itemLoadingState());
      final activity = await _apiServiceProvider.fetchActivity();
      emit(itemSuccessState(activity!, purchaseHistory));
      // print(activity);
    });
    on<PurchaseHistoryEvent>(
        (event, emit) => {purchaseHistory.add(event.data)});
  }
}
