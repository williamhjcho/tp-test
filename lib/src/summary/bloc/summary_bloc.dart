import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'summary_event.dart';
part 'summary_state.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  SummaryBloc(this.numberFormat);

  static const fakeRewardsLeft = 150;

  final NumberFormat numberFormat;

  @override
  SummaryState get initialState => const InitialSummaryState();

  @override
  Stream<SummaryState> mapEventToState(SummaryEvent event) async* {
    yield await event.apply(currentState: state, bloc: this);
  }

  Future<int> _rewardConversionRate() => Future.value(4);

  Future<int> _rewardsLeft() => Future.value(fakeRewardsLeft);
}
