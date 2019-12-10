import 'package:flutter/material.dart';
import 'package:nuds/nuds.dart';

class DetailsSummaryScreen extends StatelessWidget {
  const DetailsSummaryScreen({
    Key key,
    @required this.onNext,
  }) : super(key: key);

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    const border = Border();

    return TextSummaryScreen(
      appBar: TopBar(),
      title: 'Você está enviando',
      value: '0.000',
      onValueTap: () {},
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
