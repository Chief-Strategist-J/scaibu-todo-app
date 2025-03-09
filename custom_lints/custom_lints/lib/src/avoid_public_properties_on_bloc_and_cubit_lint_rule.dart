import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:custom_lints/core/constant/bloc_lint_constants.dart';

class AvoidPublicPropertiesOnBlocAndCubitLintRule extends DartLintRule {
  const AvoidPublicPropertiesOnBlocAndCubitLintRule()
      : super(
    code: const LintCode(
      name: 'avoid_public_properties_on_bloc_and_cubit',
      problemMessage:
      '''Avoid public properties on Bloc and Cubit besides state.''',
      errorSeverity: ErrorSeverity.ERROR,
    ),
  );

  @override
  void run(
      CustomLintResolver resolver,
      ErrorReporter reporter,
      CustomLintContext context,
      ) {
    context.registry.addClassDeclaration((node) {
      final superClass = node.extendsClause?.superclass.element?.name;

      if (superClass == BlocLintConstants.blocClass ||
          superClass == BlocLintConstants.cubitClass) {
        for (final member in node.members) {
          if (member is FieldDeclaration) {
            for (final variable in member.fields.variables) {
              final isPublic = !variable.name.lexeme.startsWith('_');
              if (isPublic) {
                reporter.atToken(variable.name, code);
              }
            }
          }
        }
      }
    });
  }
}