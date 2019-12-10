import 'package:equatable/equatable.dart';

import 'result/result_state.dart';
import 'simulation/simulation_state.dart';
import 'summary/summary_state.dart';

class TransferPointsState extends Equatable {
  const TransferPointsState({
    this.simulation = const SimulationState(),
    this.summary = const SummaryState(),
    this.result = const ResultState(),
  }) : super();

  final SimulationState simulation;
  final SummaryState summary;
  final ResultState result;

  int get points => simulation.points;

  @override
  List<Object> get props => [simulation, summary, result];
}
