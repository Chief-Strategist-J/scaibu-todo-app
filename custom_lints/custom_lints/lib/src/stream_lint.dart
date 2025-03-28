import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart' show ErrorReporter;
import 'package:custom_lint_builder/custom_lint_builder.dart'
    show CustomLintContext, CustomLintResolver, DartLintRule, LintCode;

class PreferStreamsOverFutures extends DartLintRule {
  PreferStreamsOverFutures() : super(code: _code);

  static final _code = LintCode(
    name: 'prefer_streams_over_futures',
    problemMessage: 'Use Stream<T> instead of Future<T> for better reactivity.',
    correctionMessage: 'Replace Future<T> with Stream<T> if possible.',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addFunctionDeclaration((node) {
      final returnTypeNode = node.returnType;

      if (returnTypeNode != null &&
          returnTypeNode.toSource().startsWith('Future<')) {
        // Check if the return type is Future<void> or Future<dynamic>
        final returnTypeSource = returnTypeNode.toSource();
        if (returnTypeSource == 'Future<void>' ||
            returnTypeSource == 'Future<dynamic>') {
          // Check if it's statically type-cast
          final parent = node.parent;
          if (parent is TypeAnnotation) {
            // We are checking for explicit type casting on the return type
            if (parent.type != null &&
                parent.type!.toString().startsWith('Future')) {
              return; // Skip if it's statically type-cast to Future
            }
          }
        }

        final source = resolver.source;

        final error = AnalysisError.forValues(
          source: source,
          offset: returnTypeNode.offset,
          length: returnTypeNode.length,
          errorCode: code,
          message: code.problemMessage,
          correctionMessage: code.correctionMessage,
        );

        reporter.reportError(error);
      }
    });
  }
}
