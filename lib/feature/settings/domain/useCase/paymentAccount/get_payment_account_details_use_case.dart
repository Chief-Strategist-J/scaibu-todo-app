import 'package:todo_app/core/app_library.dart';


class ConcretePaymentAccountDetails {
  final String accountId;
  final String accountHolderName;
  final String cardType;

  ConcretePaymentAccountDetails({required this.accountId, required this.accountHolderName, required this.cardType});
}

class GetPaymentAccountDetailsUseCase extends UseCase<ConcretePaymentAccountDetails, String> {
  final PaymentAccountRepository<ConcretePaymentAccountDetails> paymentAccountRepository;

  GetPaymentAccountDetailsUseCase({required this.paymentAccountRepository});

  @override
  Future<Either<Failure, ConcretePaymentAccountDetails>> call(String userId) async {
    try {
      final details = await paymentAccountRepository.getPaymentAccountDetails(userId);
      return Right(details);
    } catch (e) {
      return Left(ServerFailure('Failed to get payment account details'));
    }
  }
}
