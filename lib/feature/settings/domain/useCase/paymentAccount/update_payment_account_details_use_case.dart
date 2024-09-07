import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class UpdatePaymentAccountDetailsParams {
  final String userId;
  final Map<String, dynamic> paymentDetails;

  UpdatePaymentAccountDetailsParams({required this.userId, required this.paymentDetails});
}

class UpdatePaymentAccountDetailsUseCase extends UseCase<void, UpdatePaymentAccountDetailsParams> {
  final PaymentAccountRepository<void> paymentAccountRepository;

  UpdatePaymentAccountDetailsUseCase({required this.paymentAccountRepository});

  @override
  Future<Either<Failure, void>> call(UpdatePaymentAccountDetailsParams params) async {
    try {
      await paymentAccountRepository.updatePaymentAccountDetails(params.userId, params.paymentDetails);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update payment account details'));
    }
  }
}
