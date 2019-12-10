import 'package:flutter/material.dart';
import 'package:nuds/nuds.dart';

class DetailsSummaryScreen extends StatelessWidget {
  const DetailsSummaryScreen({
    Key key,
    this.appBar,
    @required this.onNext,
    @required this.onEdit,
    this.points,
  }) : super(key: key);

  final PreferredSizeWidget appBar;
  final VoidCallback onNext;
  final VoidCallback onEdit;
  final String points;

  @override
  Widget build(BuildContext context) {
    const border = Border();

    return TextSummaryScreen(
      appBar: appBar,
      title: 'Você está enviando',
      value: points,
      onValueTap: onEdit,
      description: 'Milhas para Smiles',
      body: SliverChildListDelegate([
        TableItem(
          primaryText: 'Rewards usados',
          secondaryText: '12.345',
          border: border,
        ),
        TableItem(
          primaryText: 'Rewards restantes',
          secondaryText: '0',
          border: border,
        ),
        TableItem(
          primaryText: 'Taxa de conversão',
          secondaryText: '4 Rewards = 1 milha',
          border: border,
        ),
      ]),
      footNote: 'As milhas podem demorar até 24 horas para serem processadas '
          'pelo programa de pontos.',
      bottom: BottomButton(
        text: 'CONFIRMAR TRANSFERÊNCIA',
        primary: true,
        onPressed: onNext,
      ),
    );
  }
}
