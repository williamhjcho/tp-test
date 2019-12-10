import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'simulation_event.dart';
part 'simulation_state.dart';

class SimulationBloc extends Bloc<SimulationEvent, SimulationState> {
  static const fakeTransferableSmile = 2500;
  static const fakeRewardsConversion = 4;
  static const errorMaxAllowedReachedMessage = 'Quantidade acima do permitido.';

  @override
  SimulationState get initialState => const InitialSimulationState();

  @override
  Stream<SimulationState> mapEventToState(SimulationEvent event) async* {
    try {
      yield await event.apply(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield state;
    }
  }

  String _inputError(int smiles) {
    if (smiles == null) {
      return null;
    } else if (smiles > fakeTransferableSmile) {
      return errorMaxAllowedReachedMessage;
    }
    return null;
  }
}
