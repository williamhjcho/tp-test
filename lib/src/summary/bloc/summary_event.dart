part of 'summary_bloc.dart';

@immutable
abstract class SummaryEvent {
  const SummaryEvent();

  Future<SummaryState> apply({SummaryState currentState, SummaryBloc bloc});
}

@immutable
class KickoffEvent extends SummaryEvent {
  const KickoffEvent(this.smilesClaiming) : assert(smilesClaiming != null);

  final int smilesClaiming;

  @override
  Future<SummaryState> apply(
      {SummaryState currentState, SummaryBloc bloc}) async {
    final rewardConversionRate = await bloc._rewardConversionRate();
    return LoadedSummaryState(
      smilesClaiming: bloc.numberFormat.format(smilesClaiming),
      rewardsConversionRate: rewardConversionRate,
      rewardsLeft: bloc.numberFormat.format(await bloc._rewardsLeft()),
      rewardsUsed:
      bloc.numberFormat.format(smilesClaiming * rewardConversionRate),
    );
  }
}
