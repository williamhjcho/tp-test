import 'package:flutter/material.dart';
import 'package:nuds/nuds.dart';
import 'package:transfer_points_testing/client/client.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: (settings) {
        return NuDSPageRoute<void>(
          settings: settings,
          builder: (context) => MyHomePage(),
        );
      },
      builder: (context, child) {
        return NuDSTheme(
          theme: NuDSThemeData(),
          child: child,
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(title: 'TRANSFER POINTS TEST'),
      body: Align(
        alignment: Alignment.topCenter,
        child: FlatButton(
          child: const Text('START'),
          onPressed: () => openTransferPoints(context),
        ),
      ),
    );
  }
}
