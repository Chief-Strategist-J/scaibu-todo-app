import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:custom_lints/core/constant/bloc_lint_constants.dart';

class StateBaseClassSuffix extends DartLintRule {
  const StateBaseClassSuffix()
    : super(
        code: const LintCode(
          name: 'state_base_class_suffix',
          problemMessage:
              '''The base state class should always be suffixed by 'State'.''',
          errorSeverity: ErrorSeverity.ERROR,
        ),
      );

  static const _ignoredType = [
    'int',
    'double',
    'num',
    'String',
    'bool',
    'List',
    'Set',
    'Map',
  ];

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addExtendsClause((node) {
      final superClass = node.superclass;
      TypeAnnotation? stateNode;

      if (superClass.element?.name == BlocLintConstants.cubitClass) {
        stateNode = superClass.typeArguments?.arguments[0];
      } else if (superClass.element?.name == BlocLintConstants.blocClass) {
        stateNode = superClass.typeArguments?.arguments[1];
      }
      if (stateNode == null) {
        return;
      }
      final stateType = stateNode.type as InterfaceType?;
      if (stateType == null || _ignoredType.contains(stateType.element.name)) {
        return;
      }

      if (stateType.element.name.endsWith('State') == false) {
        reporter.atNode(stateNode, code);
      }
    });
  }
}
