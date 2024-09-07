import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class AddPaymentMethodParams {
  final String userId;
  final Map<String, dynamic> paymentMethod;

  AddPaymentMethodParams({required this.userId, required this.paymentMethod});
}

class AddPaymentMethodUseCase extends UseCase<void, AddPaymentMethodParams> {
  final PaymentAccountRepository<void> paymentAccountRepository;

  AddPaymentMethodUseCase({required this.paymentAccountRepository});

  @override
  Future<Either<Failure, void>> call(AddPaymentMethodParams params) async {
    try {
      await paymentAccountRepository.addPaymentMethod(params.userId, params.paymentMethod);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add payment method'));
    }
  }
}
