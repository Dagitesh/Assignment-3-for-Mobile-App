import 'package:equatable/Equatable.dart';
import 'package:shemsu_suk/model/item.dart';

abstract class itemState extends Equatable {}

class itemInitialState extends itemState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class itemLoadingState extends itemState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class itemSuccessState extends itemState {
  final List activity;
  List purchaseHistory;

  itemSuccessState(
    this.activity,
    this.purchaseHistory,
  );

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class itemFailState extends itemState {
  String message;

  itemFailState(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
