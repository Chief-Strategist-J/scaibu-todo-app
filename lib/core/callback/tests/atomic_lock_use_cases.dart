import 'dart:async';
import 'dart:developer';

import 'package:todo_app/core/callback/service/atomic_lock.dart';

void main() async {
  // Create an instance of AtomicLock with default settings
  final AtomicLock lock = AtomicLock();

  // Function to simulate a critical section that needs synchronization
  Future<void> criticalSection(final int taskId) async {
    await lock.synchronized(() async {
      // This block of code is synchronized with the lock
      log('Task $taskId started');
      await Future<dynamic>.delayed(const Duration(seconds: 2));
      // Simulating some work
      log('Task $taskId completed');
    });
  }

  // Start multiple tasks that try to access the critical section
  await Future.wait(<Future<void>>[
    criticalSection(1),
    criticalSection(2),
    criticalSection(3),
  ]);

  // Print lock metrics after all tasks are completed
  await Future<dynamic>.delayed(const Duration(seconds: 5));
  // Wait for all tasks to finish
  log('Lock Metrics: ${lock.metrics}');

  final DatabaseService dbService = DatabaseService();

  // Simulate multiple requests to update the database
  await Future.wait(<Future<void>>[
    dbService.updateDatabase('User 1 data'),
    dbService.updateDatabase('User 2 data'),
    dbService.updateDatabase('User 3 data'),
  ]);
}

/// demo
class DatabaseService {
  final AtomicLock _lock = AtomicLock();

  ///
  Future<void> updateDatabase(final String data) async {
    await _lock.synchronized(() async {
      // Perform database update (only one task can update at a time)
      log('Updating database with: $data');
      await Future<dynamic>.delayed(
        const Duration(seconds: 2),
      );

      // Simulate DB update
      log('Database updated');
    });
  }
}
