import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:custom_lints/src/avoid_public_methods_on_bloc_lint_rule.dart';
import 'package:custom_lints/src/avoid_public_properties_on_bloc_and_cubit_lint_rule.dart';
import 'package:custom_lints/src/event_base_class_suffix.dart';
import 'package:custom_lints/src/state_base_class_suffix.dart';
import 'package:custom_lints/src/stream_lint.dart';

// The correct class is PluginBase, not CustomLintPlugin
PluginBase createPlugin() => _CustomLintPlugin();

class _CustomLintPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
    PreferStreamsOverFutures(),
    const AvoidPublicMethodsOnBlocLintRule(),
    const AvoidPublicPropertiesOnBlocAndCubitLintRule(),
    const EventBaseClassSuffix(),
    const StateBaseClassSuffix(),
  ];
}
