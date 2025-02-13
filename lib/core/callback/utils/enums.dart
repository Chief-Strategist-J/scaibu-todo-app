/// Represents the network status of the application.
enum NetworkStatus {
  /// Indicates that the device is connected to the internet.
  online,

  /// Indicates that the device is not connected to the internet.
  offline
}

/// Represents the priority level of operations.
enum Priority {
  /// High priority for critical operations.
  high,

  /// Medium priority for standard operations.
  medium,

  /// Low priority for less critical operations.
  low
}

/// Defines synchronization strategies for queued operations.
enum SyncStrategy {
  /// Immediate synchronization after an operation.
  immediate,

  /// Batched synchronization of multiple operations.
  batched,

  /// Periodic synchronization at regular intervals.
  periodic
}
