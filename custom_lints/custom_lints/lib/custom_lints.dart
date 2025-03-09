import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:custom_lints/src/stream_lint.dart';


// The correct class is PluginBase, not CustomLintPlugin
PluginBase createPlugin() => _CustomLintPlugin();

class _CustomLintPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
    PreferStreamsOverFutures(),
  ];
}