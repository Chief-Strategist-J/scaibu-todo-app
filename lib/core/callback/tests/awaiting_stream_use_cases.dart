// Example usage
import 'package:nb_utils/nb_utils.dart';
import 'package:todo_app/core/callback/service/awaiting_stream.dart';

void main() async {
  // Simulate a high-volume stream
  final Stream<int> highVolumeStream = Stream<int>.fromIterable(
      List<int>.generate(100000000, (final int i) => i));

  try {
    // Configure based on your specific workload characteristics
    final List<int> results = await highVolumeStream.awaitingStream<int>(
      batchSize: 5,
      isolateCount: 2,
    );

    log('Processed ${results.length} items');
    log('First few items: ${results.take(5)}');
    log('Last few items: ${results.reversed.take(5).toList().reversed}');
  } catch (e) {
    log('Error processing stream: $e');
  }
}
