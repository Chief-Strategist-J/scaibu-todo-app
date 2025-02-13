import 'package:flutter/cupertino.dart';
import 'package:todo_app/core/callback/callback_handler.dart';
import 'package:todo_app/core/callback/models/execute_result.dart';
import 'package:todo_app/core/callback/utils/enums.dart';

///
Future<void> callbackHandlerTest() async {
  final CallbackHandler<Map<String, dynamic>> handler =
      CallbackHandler<Map<String, dynamic>>()
        ..configure(
          syncStrategy: SyncStrategy.immediate,
          syncInterval: const Duration(minutes: 1),
          maxRetries: 3,
          baseRetryDelay: const Duration(seconds: 2),
        );

  handler.networkStatusStream.listen((final NetworkStatus status) {
    debugPrint('Network status: $status');
  });

  handler.operationResults.listen(
    (final ExecuteResult<Map<String, dynamic>> result) {
      result.fold(
        (final Map<String, dynamic> data) => debugPrint(
          'Operation succeeded: $data',
        ),
        (final Exception error) => debugPrint(
          'Operation failed: $error',
        ),
      );
    },
  );

  final ExecuteResult<Map<String, dynamic>> result = await handler.execute(
    operationId: 'user_data_sync',
    priority: Priority.high,
    onlineOperation: () async => <String, dynamic>{
      'userId': '123',
      'data': 'online data',
    },
    offlineOperation: () async => <String, dynamic>{
      'userId': '123',
      'data': 'offline data',
    },
    validator: (final Map<String, dynamic> data) => data.containsKey('userId'),
    transformer: (final Map<String, dynamic> data) => <String, dynamic>{
      ...data,
      'timestamp': DateTime.now().toString(),
    },
  );

  result.fold(
    (final Map<String, dynamic> data) => debugPrint('Success: $data'),
    (final Exception error) => debugPrint('Error: $error'),
  );

  await handler.dispose();
}
