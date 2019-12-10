import 'package:equatable/equatable.dart';

class SimulationState extends Equatable {
  const SimulationState({
    this.loading = true,
    this.points = 0,
    this.error,
  })  : assert(loading != null),
        assert(points != null),
        super();

  final bool loading;
  final int points;
  final Object error;

  SimulationState copyWith({
    bool loading,
    int points,
    Object error,
  }) =>
      SimulationState(
        loading: loading ?? this.loading,
        points: points ?? this.points,
        error: error,
      );

  @override
  List<Object> get props => [loading, points, error];
}
