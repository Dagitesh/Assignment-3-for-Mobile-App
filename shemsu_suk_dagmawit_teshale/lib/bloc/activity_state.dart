import 'package:equatable/equatable.dart';

abstract class ActivityState extends Equatable {
  const ActivityState();

  @override
  List<Object> get props => [];
}

class TestInitialState extends ActivityState {}

class ActivityLoadingState extends ActivityState {}

class ActivitySuccess extends ActivityState {
  final List grocery;
  const ActivitySuccess({required this.grocery});
}
 