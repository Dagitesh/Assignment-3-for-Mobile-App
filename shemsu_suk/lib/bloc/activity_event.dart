import 'package:equatable/equatable.dart';
import 'package:shemsu_suk/model/item.dart';

abstract class itemEvent extends Equatable {}

class GetDataButtonPressed extends itemEvent {
  @override
  List<Object> get props => [];
}

class PurchaseHistoryEvent extends itemEvent {
  final item asbeza;
  PurchaseHistoryEvent({required this.asbeza});

  @override
  List<Object> get props => [];

  get data => asbeza;
}
