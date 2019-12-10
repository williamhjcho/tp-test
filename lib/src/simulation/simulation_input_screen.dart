import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuds/nuds.dart';

import '../utils/points_input_formatter.dart';

class SimulationInputScreen extends StatefulWidget {
  const SimulationInputScreen({
    Key key,
    @required this.onClose,
    @required this.onNext,
  }) : super(key: key);

  final VoidCallback onClose;
  final ValueChanged<int> onNext;

  @override
  _SimulationInputScreenState createState() => _SimulationInputScreenState();
}

class _SimulationInputScreenState extends State<SimulationInputScreen> {
  final textController = TextEditingController();
  final pointsFormatter = PointsInputFormatter();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextInputScreen(
      appBar: TopBar(leadingOnPressed: widget.onClose),
      title: 'Quantas milhas Smiles você precisa?',
      controller: textController,
      autofocus: true,
      errorText: null,
      helperText: 'Transfira até 4.736 Smiles\n4 Rewards = 1 Smiles',
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly,
        pointsFormatter,
      ],
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: false,
      ),
      bottom: BottomButton(
        text: 'CONTINUAR',
        primary: true,
        onPressed: _onContinue,
      ),
    );
  }

  void _onContinue() {
    int value;
    final text = textController.text;
    if (text != null && text.isNotEmpty) {
      value = pointsFormatter.parse(text);
    }

    widget.onNext(value ?? 0);
  }
}
