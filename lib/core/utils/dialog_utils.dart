import 'package:flutter/material.dart';

class DialogUtils {
  static const String loadingDialogRouteName = '/loading-dialog';

  static void showLoadingProgress(
    BuildContext context, {
    bool cancellable = false,
  }) =>
      showDialog(
        routeSettings: const RouteSettings(name: loadingDialogRouteName),
        useRootNavigator: true,
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.grey.withOpacity(0.5),
        builder: (BuildContext context) => WillPopScope(
          onWillPop: () async => cancellable,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.primaries[0]),
            ),
          ),
        ),
      );

  static void dismissLoadingProgress(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).popUntil(
          (Route<dynamic> route) =>
              route.settings.name != loadingDialogRouteName);
}
