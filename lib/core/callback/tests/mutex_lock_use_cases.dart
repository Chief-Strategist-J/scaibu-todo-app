import 'package:todo_app/core/app_library.dart';

/// ----------------------------
/// await mutex.lock();
/// try {
///   // critical section
/// } finally {
///   mutex.unlock();
/// }
///---------------------------------

/// -------------------------------
/// await mutex.protect(() async {
///   // critical section
/// });
///---------------------------------

///---------------------------------
/// if (mutex.tryLock()) {
///   try {
///     // critical section
///   } finally {
///     mutex.unlock();
///   }
/// } else {
///   // handle busy case
/// }
///---------------------------------

///---------------------------------
/// final acquired = await mutex.lockWithTimeout(Duration(seconds: 1));
/// if (acquired) {
///   try {
///     // critical section
///   } finally {
///     mutex.unlock();
///   }
/// } else {
///   // handle timeout
/// }
/// --------------------------------------

Future<void> main() async {
  // Example of protecting critical sections in different components
  await databaseExample();
  await fileSystemExample();
  await concurrencyExample();
  await hierarchicalLocking();
  // Print metrics to see what happened
  log('Mutex metrics: ${MutexService().getMetrics()}');

  final ReadWriteLock lock = ReadWriteLock('resource');

  // Reading operation
  Future<void> performRead() async {
    await lock.read(() async {
      log('Reading data...');
      await Future<dynamic>.delayed(const Duration(seconds: 1));
      log('Read complete');
    });
  }

  // Writing operation
  Future<void> performWrite() async {
    await lock.write(() async {
      log('Writing data...');
      await Future<dynamic>.delayed(const Duration(seconds: 1));
      log('Write complete');
    });
  }

  // Simulating concurrent reads and writes
  await Future.wait(<Future<void>>[
    performRead(),
    performRead(),
    performWrite(),
  ]);

  ///
  // Example resource pool with integers as resources
  final ResourcePool<int> pool = ResourcePool<int>(<int>[1, 2, 3], 'int-pool');

  Future<void> task(final String name) async {
    await pool.use((final int resource) async {
      log('$name acquired resource: $resource');
      await Future<dynamic>.delayed(const Duration(seconds: 2)); // Simulating
      // work
      log('$name released resource: $resource');
    });
  }

  // Simulate multiple concurrent tasks acquiring resources
  await Future.wait(<Future<void>>[
    task('Task A'),
    task('Task B'),
    task('Task C'),
    task('Task D'),
  ]).then((final _) => log('All tasks completed'));
}

///
Future<void> databaseExample() async {
  final IMutex dbMutex = MutexService().getMutex('database');

  // Using protect pattern (recommended)
  final String result = await dbMutex.protect(() async {
    log('Performing database operation');
    await Future<dynamic>.delayed(const Duration(milliseconds: 100));
    return 'database result';
  });

  log('Database result: $result');
}

///
Future<void> fileSystemExample() async {
  final IMutex fsMutex = MutexService().getMutex('filesystem');

  // Try lock pattern
  if (fsMutex.tryLock()) {
    try {
      log('Performing file operation with non-blocking lock');
      await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    } finally {
      fsMutex.unlock();
    }
  } else {
    log('File system is busy, trying with timeout');

    // Lock with timeout pattern
    final bool acquired =
        await fsMutex.lockWithTimeout(const Duration(seconds: 1));
    if (acquired) {
      try {
        log('Acquired lock with timeout');
        await Future<dynamic>.delayed(const Duration(milliseconds: 50));
      } finally {
        fsMutex.unlock();
      }
    } else {
      log('Failed to acquire lock within timeout');
    }
  }
}

///
Future<void> concurrencyExample() async {
  final IMutex sharedMutex = MutexService().getMutex('shared-resource');

  // Launch multiple concurrent operations
  final List<Future<dynamic>> futures = <Future<dynamic>>[];

  for (int i = 0; i < 5; i++) {
    futures.add(() async {
      log('Task $i: Waiting for lock');
      await sharedMutex.protect(() async {
        log('Task $i: Got lock, working');
        await Future<dynamic>.delayed(const Duration(milliseconds: 100));
        log('Task $i: Completed work');
      });
    }());
  }

  // Wait for all operations to complete
  await Future.wait(futures);

  // Check metrics
  log('Concurrency metrics: ${MutexService().getMetrics()}');

  final MutexTransaction transaction =
      MutexTransaction(<String>{'user_db', 'order_db'});

  await transaction.execute(() async {
    // Simulate database operations
    log('Updating user database...');
    await Future<dynamic>.delayed(const Duration(seconds: 1));

    log('Updating order database...');
    await Future<dynamic>.delayed(const Duration(seconds: 1));

    log('Transaction completed successfully.');
  }).catchError((final dynamic error) {
    log('Transaction failed: $error');
  });

  final MutexTransaction newTransaction = MutexTransaction(<String>{
    'log_file',
    'config_file',
  });

  await newTransaction.execute(() async {
    log('Writing to log file...');
    await Future<dynamic>.delayed(const Duration(seconds: 1));

    log('Writing to config file...');
    await Future<dynamic>.delayed(const Duration(seconds: 1));

    log('File operations completed.');
  }).catchError((final dynamic error) {
    log('Error in file write: $error');
  });

  // Create an instance of PriorityMutex
  final PriorityMutex mutex = PriorityMutex('exampleMutex');

  // Simulating multiple tasks trying to acquire the lock with different
  // priorities
  Future<void> task(
    final String name,
    final int priority,
    final int duration,
  ) async {
    log('$name is trying to acquire the lock with priority $priority');
    await mutex.lock(priority: priority);
    log('$name has acquired the lock');

    // Simulate some work with varying durations
    await Future<void>.delayed(Duration(seconds: duration));

    log('$name is releasing the lock');
    // Assume an unlock method exists in IMutex
    mutex.unlock();
  }

  // Launch tasks with different priorities and execution durations
  final List<Future<void>> tasks = <Future<void>>[
    task('Task A', 5, 3),
    task('Task B', 2, 2),
    task('Task C', 8, 1),
    task('Task D', 4, 4),
    task('Task E', 6, 2),
  ];

  // Wait for all tasks to complete
  await Future.wait(tasks);

  log('All tasks completed');

  final SimpleMutex simpleMutex = SimpleMutex('Test Mutex');
  log('Mutex Name: ${mutex.name}');
  log('Is Unused: ${mutex.isUnused}');

  if (simpleMutex.tryLock()) {
    log('Lock acquired using tryLock');
    simpleMutex.unlock();
  } else {
    log('Failed to acquire lock using tryLock');
  }

  await simpleMutex.protect(() async {
    log('Executing critical section');
    await Future<dynamic>.delayed(const Duration(seconds: 1));
  });
  log('Critical section execution complete');

  final SimpleMutex mutex1 = SimpleMutex('Mutex 1');
  final SimpleMutex mutex2 = SimpleMutex('Mutex 2');
  final ComposedLock composedLock = ComposedLock(<IMutex>[mutex1, mutex2]);

  log('Acquiring locks sequentially...');
  await composedLock.sequentialLock();
  log('All locks acquired sequentially.');
  composedLock.releaseAll();
  log('Locks released.');

  log('Attempting atomic lock with timeout...');
  final bool success = await composedLock.atomicLock(
    const Duration(seconds: 2),
  );

  if (success) {
    log('Atomic lock acquired.');
    composedLock.releaseAll();
    log('Locks released.');
  } else {
    log('Failed to acquire atomic lock within timeout.');
  }

  final CircuitBreakerMutex circuitBreaker = CircuitBreakerMutex('example');

  // Simulated operation that may fail
  Future<int> riskyOperation() async {
    final int randomValue = DateTime.now().millisecondsSinceEpoch % 2;
    if (randomValue == 0) {
      throw Exception('Simulated failure');
    }
    return 42; // Simulated success result
  }

  for (int i = 0; i < 10; i++) {
    try {
      final int result = await circuitBreaker.execute(riskyOperation);
      log('Operation succeeded with result: $result');
    } catch (e) {
      log('Operation failed: $e');
    }
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    // Delay
    // between attempts
  }
}

///
Future<void> hierarchicalLocking() async {
  // Parent resource lock
  final IMutex parentMutex = MutexService().getMutex('document-123');

  await parentMutex.protect(() async {
    // Now lock child resources
    final IMutex childMutex = MutexService().getMutex('document-123-section-A');

    await childMutex.protect(() async {
      // Operate on both parent and child safely
      // await updateDocumentAndSection();
    });
  });
}
