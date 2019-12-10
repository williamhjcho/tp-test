import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:transfer_points_testing/src/summary/bloc/summary_bloc.dart';

void main() {
  group('Summary Bloc Test.dart', () {
    SummaryBloc bloc;

    setUp(() {
      bloc = SummaryBloc(NumberFormat.decimalPattern());
    });

    test('initial state', () {
      expect(bloc.initialState, const InitialSummaryState());
      expect(bloc, emits(const InitialSummaryState()));
    });

    blocTest<SummaryBloc, SummaryEvent, SummaryState>(
      'state loads correctly',
      build: () => bloc,
      act: (bloc) async => bloc.add(const KickoffEvent(25)),
      expect: <SummaryState>[
        const InitialSummaryState(),
        loadedState(
            smiles: '25',
            rewardsLeft: SummaryBloc.fakeRewardsLeft.toString(),
            rewardsUsed: '100')
      ],
    );
  });
}

LoadedSummaryState loadedState(
    {String smiles = '0',
    int conversion = 4,
    String rewardsLeft = '0',
    String rewardsUsed = '0'}) {
  return LoadedSummaryState(
      smilesClaiming: smiles,
      rewardsConversionRate: conversion,
      rewardsLeft: rewardsLeft,
      rewardsUsed: rewardsUsed);
}
