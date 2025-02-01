part of use_case;

/// Doc Required
class ConcretePaymentAccountDetails {
  /// Doc Required
  ConcretePaymentAccountDetails({
    required this.accountId,
    required this.accountHolderName,
    required this.cardType,
  });

  /// Doc Required
  final String accountId;

  /// Doc Required
  final String accountHolderName;

  /// Doc Required
  final String cardType;
}

/// Doc Required
class GetPaymentAccountDetailsUseCase
    extends UseCase<ConcretePaymentAccountDetails, String> {
  /// Doc Required
  GetPaymentAccountDetailsUseCase({required this.paymentAccountRepository});

  /// Doc Required
  final PaymentAccountRepository<ConcretePaymentAccountDetails>
      paymentAccountRepository;

  /// Doc Required
  @override
  Future<Either<Failure, ConcretePaymentAccountDetails>> call(
    final String params,
  ) async {
    try {
      final ConcretePaymentAccountDetails details =
          await paymentAccountRepository.getPaymentAccountDetails(params);
      return Right<Failure, ConcretePaymentAccountDetails>(details);
    } catch (e) {
      return Left<Failure, ConcretePaymentAccountDetails>(
        ServerFailure('Failed to get payment account details'),
      );
    }
  }
}
