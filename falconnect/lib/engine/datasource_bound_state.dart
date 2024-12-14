// ignore_for_file: constant_identifier_names

import 'package:falconnect/lib.dart';

class DatasourceBoundState<EntityType, ResponseType> {
  DatasourceBoundState._();

  static const String TAG = 'DatasourceBoundState';

  /// Converts a local database operation into a Stream that handles local data fetching only.
  /// Returns a Stream of Either<Failure, EntityType> to handle success and failure cases.
  ///
  /// This is a local-only version focused solely on database operations,
  /// without any remote API calls.
  ///
  /// Parameters:
  /// * [loadFromDbFuture] - Required function to load data from local database.
  ///   Returns Future<EntityType>.
  ///
  /// * [handleError] - Optional custom error handler.
  ///   Takes (error, stackTrace) and returns custom Failure.
  ///   If not provided, default Failure will be used.
  ///
  /// Flow:
  /// 1. Executes [loadFromDbFuture] to fetch local data
  /// 2. Emits local data as Either.Right<EntityType>
  ///
  /// Error Handling:
  /// - All database errors are wrapped in Either.Left<Failure>
  /// - Custom error handling can be implemented via [handleError]
  /// - Default Failure includes error message, exception, and stack trace
  ///
  /// Example:
  /// ```dart
  /// final stream = NetworkBoundResource.asLocalStream<DomainModel>(
  ///   loadFromDbFuture: () => database.loadData(),
  ///   handleError: (error, stackTrace) => DatabaseFailure(error),
  /// );
  /// ```
  static Stream<Either<Failure, EntityType>> asLocalStream<EntityType>({
    required Future<EntityType> Function() loadFromDbFuture,
    Failure Function(dynamic error, StackTrace stacktrace)? handleError,
  }) async* {
    try {
      EntityType dataFromDb = await loadFromDbFuture();
      NLog.i(TAG, 'Success load data from database');
      yield Right(dataFromDb);
      return;
    } catch (exception, stackTrace) {
      NLog.e(TAG, 'Load from DB failed', exception);
      final failure = handleError?.call(exception, stackTrace);
      yield Left(failure ??
          Failure(
            message: exception.toString(),
            exception: exception,
            stacktrace: stackTrace,
          ));
      return;
    }
  }

  /// Converts a remote API call into a Stream that handles remote operations only.
  /// Returns a Stream of Either<Failure, EntityType> to handle success and failure cases.
  ///
  /// This is a simplified version of asStream() that only handles remote data fetching,
  /// without local database operations.
  ///
  /// Parameters:
  /// * [createCallFuture] - Required function to fetch data from remote source.
  ///   Returns Future<ResponseType>.
  ///
  /// * [processResponse] - Required when ResponseType differs from EntityType.
  ///   Converts ResponseType to EntityType.
  ///   If not provided, ResponseType must be the same as EntityType for direct casting.
  ///
  /// * [handleError] - Optional custom error handler.
  ///   Takes (error, stackTrace) and returns custom Failure.
  ///   If not provided, default Failure will be used.
  ///
  /// Flow:
  /// 1. Executes [createCallFuture] to fetch remote data
  /// 2. If [processResponse] exists, converts ResponseType to EntityType
  /// 3. If no [processResponse], attempts direct cast from ResponseType to EntityType
  /// 4. Emits processed data as Either.Right<EntityType>
  ///
  /// Error Handling:
  /// - All errors are wrapped in Either.Left<Failure>
  /// - Custom error handling can be implemented via [handleError]
  /// - Default Failure includes error message, exception, and stack trace
  ///
  /// Example:
  /// ```dart
  /// final stream = NetworkBoundResource.asRemoteStream<ApiResponse, DomainModel>(
  ///   createCallFuture: () => api.fetchData(),
  ///   processResponse: (response) => response.toDomainModel(),
  ///   handleError: (error, stackTrace) => CustomFailure(error),
  /// );
  /// ```
  static Stream<Either<Failure, EntityType>>
      asRemoteStream<ResponseType, EntityType>({
    required Future<ResponseType> Function() createCallFuture,
    FutureOr<EntityType> Function(ResponseType response)? processResponse,
    Failure Function(dynamic error, StackTrace stacktrace)? handleError,
  }) async* {
    assert(
      ResponseType == EntityType ||
          (!(ResponseType == EntityType) && processResponse != null),
      'You need to specify the `processResponse` when the EntityType and ResponseType types are different',
    );
    try {
      final ResponseType response = await createCallFuture();
      NLog.i(TAG, 'Success fetch data');

      late EntityType data;
      if (processResponse != null) {
        final EntityType processedData = await processResponse(response);
        data = processedData;
      } else {
        final EntityType castData = response as EntityType;
        data = castData;
      }

      yield Right(data);
      return;
    } catch (exception, stackTrace) {
      NLog.e(TAG, 'Fetching failed', exception);
      final failure = handleError?.call(exception, stackTrace);
      yield Left(failure ??
          Failure(
            message: exception.toString(),
            exception: exception,
            stacktrace: stackTrace,
          ));
      return;
    }
  }

  /// Converts asynchronous operations into a Stream that handles both local database and remote API operations.
  /// Returns a Stream of Either<Failure, EntityType> to handle success and failure cases.
  ///
  /// This method implements a Repository Pattern with offline-first capability and provides
  /// a structured flow for data operations.
  ///
  /// Parameters:
  /// * [loadFromDbFuture] - Optional function to load data from local database.
  ///   Returns Future<EntityType>.
  ///
  /// * [shouldFetch] - Optional function to determine if remote fetch is needed.
  ///   Takes current local data as parameter and returns bool.
  ///   If true, remote fetch will be executed even if local data exists.
  ///
  /// * [createCallFuture] - Optional function to fetch data from remote source.
  ///   Returns Future<ResponseType>.
  ///
  /// * [saveCallResult] - Optional function to save remote response to local database.
  ///   Takes ResponseType as parameter.
  ///
  /// * [processResponse] - Required when ResponseType differs from EntityType.
  ///   Converts ResponseType to EntityType.
  ///
  /// * [handleError] - Optional custom error handler.
  ///   Takes (error, stackTrace) and returns custom Failure.
  ///   If not provided, default Failure will be used.
  ///
  /// Flow:
  /// 1. If [loadFromDbFuture] exists:
  ///    - Loads local data first
  ///    - Emits local data if successful
  ///    - If [shouldFetch] returns true, proceeds to fetch remote data
  ///
  /// 2. If [createCallFuture] exists:
  ///    - Fetches remote data
  ///    - Saves to local database if [saveCallResult] is provided
  ///    - Processes response using [processResponse] if provided
  ///    - Emits processed data
  ///
  /// Error Handling:
  /// - All errors are wrapped in Either.Left<Failure>
  /// - Custom error handling can be implemented via [handleError]
  /// - Default Failure includes error message, exception, and stack trace
  ///
  /// Example:
  /// ```dart
  /// final stream = NetworkBoundResource.asStream<ApiResponse, DomainModel>(
  ///   loadFromDbFuture: () => database.loadData(),
  ///   shouldFetch: (data) => data == null || data.isStale,
  ///   createCallFuture: () => api.fetchData(),
  ///   saveCallResult: (response) => database.saveData(response),
  ///   processResponse: (response) => response.toDomainModel(),
  ///   handleError: (error, stackTrace) => CustomFailure(error),
  /// );
  /// ```
  static Stream<Either<Failure, EntityType>>
      asStream<ResponseType, EntityType>({
    Future<EntityType> Function()? loadFromDbFuture,
    bool Function(EntityType? data)? shouldFetch,
    Future<ResponseType> Function()? createCallFuture,
    Future? Function(ResponseType response)? saveCallResult,
    FutureOr<EntityType> Function(ResponseType response)? processResponse,
    Failure Function(dynamic error, StackTrace stacktrace)? handleError,
  }) async* {
    assert(
      ResponseType == EntityType ||
          (!(ResponseType == EntityType) && processResponse != null),
      'You need to specify the `processResponse` when the EntityType and ResponseType types are different',
    );

    ///========================= INNER METHOD =========================///
    Stream<Either<Failure, EntityType>> fetchRemoteData() async* {
      if (createCallFuture != null) {
        try {
          final ResponseType response = await createCallFuture();
          NLog.i(TAG, 'Success fetch data');

          if (saveCallResult != null) {
            await saveCallResult(response);
            NLog.i(TAG, 'Success save result data');
          }

          late EntityType data;
          if (processResponse != null) {
            final EntityType processedData = await processResponse(response);
            data = processedData;
          } else {
            final EntityType castData = response as EntityType;
            data = castData;
          }
          yield Right(data);
        } catch (exception, stackTrace) {
          NLog.e(TAG, 'Fetching failed', exception);
          final failure = handleError?.call(exception, stackTrace);
          yield Left(failure ??
              Failure(
                message: exception.toString(),
                exception: exception,
                stacktrace: stackTrace,
              ));
        }
      }
      return;
    }

    Future<EntityType> loadDbData() async {
      try {
        return await loadFromDbFuture!.call();
      } catch (exception, stackTrace) {
        NLog.e(TAG, 'Load from DB failed', exception);
        final failure = handleError?.call(exception, stackTrace);
        throw failure ??
            Failure(
              message: exception.toString(),
              exception: exception,
              stacktrace: stackTrace,
            );
      }
    }

    ///========================= END INNER =========================///

    if (loadFromDbFuture != null && createCallFuture != null) {
      EntityType dataFromDb;
      try {
        dataFromDb = await loadDbData();
      } on Failure catch (failure) {
        yield Left(failure);
        return;
      }
      NLog.i(TAG, 'Success load data from database');
      if (shouldFetch != null && shouldFetch(dataFromDb)) {
        NLog.i(TAG, 'Loading... data from network');
        yield Right(dataFromDb);
        yield* fetchRemoteData();
        return;
      } else {
        NLog.i(TAG, 'Fetching data its not necessary');
        yield Right(dataFromDb);
        return;
      }
    } else if (loadFromDbFuture != null) {
      EntityType dataFromDb;
      try {
        dataFromDb = await loadDbData();
      } on Failure catch (failure) {
        yield Left(failure);
        return;
      }
      NLog.i(TAG, 'Success load data from database');
      yield Right(dataFromDb);
      return;
    } else if (createCallFuture != null) {
      NLog.i(TAG, 'Loading... data from network');
      yield* fetchRemoteData();
      return;
    } else {
      throw UnimplementedError(
          'Please implement loadFromDbFuture or createCallFuture');
    }
  }
}
