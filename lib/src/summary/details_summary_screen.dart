import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuds/nuds.dart';
import 'package:transfer_points_testing/src/summary/bloc/summary_bloc.dart';

class DetailsSummaryScreen extends StatefulWidget {
  const DetailsSummaryScreen({
    Key key,
    @required this.onPrevious,
    @required this.onNext,
    @required this.transferableSmiles,
  }) : super(key: key);

  final ValueChanged<int> onNext;
  final VoidCallback onPrevious;
  final int transferableSmiles;

  @override
  _DetailsSummaryScreenState createState() => _DetailsSummaryScreenState();
}

class _DetailsSummaryScreenState extends State<DetailsSummaryScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SummaryBloc>(context)
        .add(KickoffEvent(widget.transferableSmiles));
  }

  @override
  Widget build(BuildContext context) {
    const border = Border();

    return BlocBuilder<SummaryBloc, SummaryState>(
      builder: (context, state) {
        if (state is InitialSummaryState) {
          return ShimmeringSummaryScreen(
            appBar: TopBar(),
          );
        } else if (state is LoadedSummaryState) {
          return TextSummaryScreen(
            appBar: TopBar(),
            title: 'Você está enviando',
            value: state.smilesClaiming,
            onValueTap: widget.onPrevious,
            description: 'Milhas para Smiles',
            body: SliverChildListDelegate([
              TableItem(
                primaryText: 'Rewards usados',
                secondaryText: '${state.rewardsUsed}',
                border: border,
              ),
              TableItem(
                primaryText: 'Rewards restantes',
                secondaryText: '${state.rewardsLeft}',
                border: border,
              ),
              TableItem(
                primaryText: 'Taxa de conversão',
                secondaryText:
                '${state.rewardsConversionRate} Rewards = 1 milha',
                border: border,
              ),
            ]),
            footNote:
            'As milhas podem demorar até 24 horas para serem processadas '
                'pelo programa de pontos.',
            bottom: BottomButton(
              text: 'CONFIRMAR TRANSFERÊNCIA',
              primary: true,
              onPressed: () =>
                  widget
                      .onNext(
                      int.parse(state.smilesClaiming.replaceAll(',', ''))),
            ),
          );
        }
        return Container();
      },
    );
  }
}

class SummaryScreenArguments {
  const SummaryScreenArguments(this.transferableSmiles);

  final int transferableSmiles;
}
