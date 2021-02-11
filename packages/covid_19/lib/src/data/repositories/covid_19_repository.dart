import 'package:covid_19/src/domain/entities/latest_totals.dart';
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

import 'package:meta/meta.dart';

import '../../domain/domain.dart';
import '../datasources/remote_data_source.dart';

typedef _GetLatestTotals = Future<LatestTotals> Function();

/// Covid_19 repository implementation
class Covid19Repository implements ICovid19Repository {
  /// Covid_19 repository constructor
  Covid19Repository({
    @required this.remoteDataSource,
  }) : assert(remoteDataSource != null);

  ///Remote that source that makes api call
  final RemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, LatestTotals>> getTotalsData() {
    throw UnimplementedError();
  }

  Future<Either<Failure, LatestTotals>> getCovidData(
    _GetLatestTotals getLatestTotals,
  ) async {
    try {
      final latestTotals = await getLatestTotals();
      return Right(latestTotals);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
