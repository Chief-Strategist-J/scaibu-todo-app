import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class RemovePaymentMethodParams {
  final String userId;
  final String paymentMethodId;

  RemovePaymentMethodParams({required this.userId, required this.paymentMethodId});
}

class RemovePaymentMethodUseCase extends UseCase<void, RemovePaymentMethodParams> {
  final PaymentAccountRepository<void> paymentAccountRepository;

  RemovePaymentMethodUseCase({required this.paymentAccountRepository});

  @override
  Future<Either<Failure, void>> call(RemovePaymentMethodParams params) async {
    try {
      await paymentAccountRepository.removePaymentMethod(params.userId, params.paymentMethodId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to remove payment method'));
    }
  }
}
