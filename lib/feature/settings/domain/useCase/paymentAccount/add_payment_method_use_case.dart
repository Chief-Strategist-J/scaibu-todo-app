part of use_case;

/// Doc Required
class AddPaymentMethodParams {
  /// Doc Required
  AddPaymentMethodParams({required this.userId, required this.paymentMethod});

  /// Doc Required
  final String userId;

  /// Doc Required
  final Map<String, dynamic> paymentMethod;
}

/// Doc Required
class AddPaymentMethodUseCase extends UseCase<void, AddPaymentMethodParams> {
  /// Doc Required
  AddPaymentMethodUseCase({required this.paymentAccountRepository});

  /// Doc Required
  final PaymentAccountRepository<void> paymentAccountRepository;

  /// Doc Required
  @override
  Future<Either<Failure, void>> call(
    final AddPaymentMethodParams params,
  ) async {
    try {
      await paymentAccountRepository.addPaymentMethod(
        params.userId,
        params.paymentMethod,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(ServerFailure('Failed to add payment method'));
    }
  }
}
