/// Base enum for Async Fetch Status tracking
enum FetchStatus {
  /// Initial status of the operation
  initial, 
  /// Loading status of the operation
  loading,
  /// Succes status of the operation
  success,
  /// Error status of the operation
  error;
}