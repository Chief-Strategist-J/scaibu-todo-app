part of use_case;

/// Doc Required
class UpdatePaymentAccountDetailsParams {
  /// Doc Required
  UpdatePaymentAccountDetailsParams({
    required this.userId,
    required this.paymentDetails,
  });

  /// Doc Required
  final String userId;

  /// Doc Required
  final Map<String, dynamic> paymentDetails;
}

/// Doc Required
class UpdatePaymentAccountDetailsUseCase
    extends UseCase<void, UpdatePaymentAccountDetailsParams> {
  /// Doc Required
  UpdatePaymentAccountDetailsUseCase({required this.paymentAccountRepository});

  /// Doc Required
  final PaymentAccountRepository<void> paymentAccountRepository;

  /// Doc Required
  @override
  Future<Either<Failure, void>> call(
    final UpdatePaymentAccountDetailsParams params,
  ) async {
    try {
      await paymentAccountRepository.updatePaymentAccountDetails(
        params.userId,
        params.paymentDetails,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to update payment account details'),
      );
    }
  }
}
