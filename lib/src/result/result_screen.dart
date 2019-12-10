import 'package:flutter/material.dart';
import 'package:nuds/nuds.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key key, @required this.onClose}) : super(key: key);

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return ClosureScreen.image(
      NuDSImages.chilling,
      appBar: TopBar(
        leadingIcon: NuDSIcons.close,
        leadingOnPressed: onClose,
      ),
      title: 'Tudo certo!',
      description: '''
Você enviou com sucesso 0.000 milhas para seu programa <strong>Smiles</strong>.

As milhas já estão no seu programa de pontos e podem ser usadas.
      ''',
      bottom: BottomButton(
        text: 'VOLTAR PARA O REWARDS',
        primary: true,
        onPressed: null,
      ),
    );
  }
}
