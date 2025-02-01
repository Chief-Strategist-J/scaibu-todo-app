part of use_case;

/// Doc Required
class RemovePaymentMethodParams {
  /// Doc Required
  RemovePaymentMethodParams({
    required this.userId,
    required this.paymentMethodId,
  });

  /// Doc Required
  final String userId;

  /// Doc Required
  final String paymentMethodId;
}

/// Doc Required
class RemovePaymentMethodUseCase
    extends UseCase<void, RemovePaymentMethodParams> {
  /// Doc Required
  RemovePaymentMethodUseCase({required this.paymentAccountRepository});

  /// Doc Required
  final PaymentAccountRepository<void> paymentAccountRepository;

  /// Doc Required
  @override
  Future<Either<Failure, void>> call(
    final RemovePaymentMethodParams params,
  ) async {
    try {
      await paymentAccountRepository.removePaymentMethod(
        params.userId,
        params.paymentMethodId,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to remove payment method'),
      );
    }
  }
}
