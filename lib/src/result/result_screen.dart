import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nuds/nuds.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key key, @required this.onClose})
      : assert(onClose != null),
        super(key: key);

  final VoidCallback onClose;
  static final NumberFormat _numberFormat = NumberFormat.decimalPattern();

  @override
  Widget build(BuildContext context) {
    final ResultScreenArguments args =
        ModalRoute
            .of(context)
            .settings
            .arguments;
    return ClosureScreen.image(
      NuDSImages.chilling,
      appBar: TopBar(
        leadingIcon: NuDSIcons.close,
        leadingOnPressed: onClose,
      ),
      title: 'Tudo certo!',
      description: '''
Você enviou com sucesso ${_numberFormat.format(args.smilesSent)} milhas para seu programa <strong>Smiles</strong>.

As milhas já estão no seu programa de pontos e podem ser usadas.
      ''',
      bottom: BottomButton(
        text: 'VOLTAR PARA O REWARDS',
        primary: true,
        onPressed: onClose,
      ),
    );
  }
}

class ResultScreenArguments {
  const ResultScreenArguments(this.smilesSent);

  final int smilesSent;
}
