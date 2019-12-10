import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nuds/nuds.dart';
import 'package:transfer_points_testing/business/business.dart';

import 'transfer_points_navigator.dart';

/// Simulating deep link call
Future<void> openTransferPoints(BuildContext context) {
  final store = TransferPointsStore(interactor: TransferPointsInteractor());
  return Navigator.of(context).push(NuDSCardStackPageRoute<void>(
    builder: (context) => StoreProvider(
      store: store,
      child: const TransferPointsNavigator(),
    ),
  ))
    ..whenComplete(() {
      store.dispatch(CloseStoreAction());
      store.teardown();
    });
}
