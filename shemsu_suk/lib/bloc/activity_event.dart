import 'package:equatable/equatable.dart';
import 'package:shemsu_suk/model/item.dart';

abstract class itemEvent extends Equatable {}

class GetDataButtonPressed extends itemEvent {

  @override
  List<Object> get props => [];
}

class CartHistoryEvent extends itemEvent {
  final item asbeza;
  CartHistoryEvent({required this.asbeza});

  @override
  List<Object> get props => [];

  get data => asbeza;
}
