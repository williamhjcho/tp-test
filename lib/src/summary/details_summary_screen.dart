import 'package:flutter/material.dart';
import 'package:nuds/nuds.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:transfer_points_testing/src/summary/detail_summary_model.dart';

class DetailsSummaryScreen extends StatefulWidget {
  const DetailsSummaryScreen({
    Key key,
    @required this.onEditValue,
    @required this.onNext,
    @required this.miles,
  }) : super(key: key);

  final VoidCallback onNext;
  final VoidCallback onEditValue;
  final int miles;

  @override
  _DetailsSummaryScreenState createState() => _DetailsSummaryScreenState();
}

class _DetailsSummaryScreenState extends State<DetailsSummaryScreen> {
  DetailSummaryModel model;

  @override
  void initState() {
    super.initState();
    model = DetailSummaryModel(widget.miles);
    model.loadData();
  }

  @override
  Widget build(BuildContext context) {
    const border = Border();

    return ScopedModel(
      model: model,
      child: ScopedModelDescendant<DetailSummaryModel>(
        builder: (context, child, model) {
          if (model.isLoading) {
            return ShimmeringSummaryScreen(
              appBar: TopBar(),
            );
          }

          return TextSummaryScreen(
            appBar: TopBar(),
            title: 'Você está enviando',
            value: model.miles,
            onValueTap: widget.onEditValue,
            description: 'Milhas para Smiles',
            body: SliverChildListDelegate([
              TableItem(
                primaryText: 'Rewards usados',
                secondaryText: '${model.rewardsUsed}',
                border: border,
              ),
              TableItem(
                primaryText: 'Rewards restantes',
                secondaryText: '${model.rewardsLeft}',
                border: border,
              ),
              TableItem(
                primaryText: 'Taxa de conversão',
                secondaryText: '${model.rewardsRate} Rewards = 1 milha',
                border: border,
              ),
            ]),
            footNote:
            'As milhas podem demorar até 24 horas para serem processadas '
                'pelo programa de pontos.',
            bottom: BottomButton(
              text: 'CONFIRMAR TRANSFERÊNCIA',
              primary: true,
              onPressed: widget.onNext,
            ),
          );
        },
      ),
    );
  }
}
