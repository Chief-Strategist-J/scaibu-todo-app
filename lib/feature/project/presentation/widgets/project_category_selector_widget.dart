import 'package:todo_app/core/app_library.dart';

/// Doc Required
class ProjectCategorySelectorWidget extends HookWidget {
  /// Doc Required
  const ProjectCategorySelectorWidget(this.param, {super.key});

  /// Doc Required

  final ProjectPageParam param;

  Future<void> _showProjectCategorySelector<T>({
    required final BuildContext context,
    required final String title,
    required final List<T> items,
    required final String Function(T) getCategoryName,
    required final ProjectCategoryComponentVariantStyle style,
    required final TextEditingController controller,
  }) async {
    final T? result = await showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      builder: (final _) => BlocProvider<ProjectBloc>.value(
        value: context.read<ProjectBloc>(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: ProjectCategorySelectorComponent<T>(
            title: title,
            items: items,
            onItemSelected: getCategoryName,
            style: style,
          ),
        ),
      ),
    );

    if (result != null) {
      controller.text = getCategoryName(result);
    }
  }

  @override
  Widget build(final BuildContext context) {
    final ProjectCategoryConfig<String> projectCategoryConfig = useMemoized(
      () => ProjectCategoryConfig<String>(
        title: '',
        items: <String>[],
        controller: TextEditingController(),
        focusNode: FocusNode(),
      ),
      <Object?>[param],
    );

    final List<BaseProjectCategoryConfig> configList = useMemoized(
      () => ProjectCategoryConfig.getList(param),
      <Object?>[param],
    );

    return AnimatedScrollView(
      listAnimationType: ListAnimationType.None,
      physics: const NeverScrollableScrollPhysics(),
      children: configList
          .map(
            (final BaseProjectCategoryConfig config) => ContentWidget(
              title: config.title,
              controller: config.controller,
              focusNode: config.focusNode,
              isTimeField: true,
              onTap: () async {
                hideKeyboard(context);
                await _showProjectCategorySelector(
                  context: context,
                  title: config.title,
                  items: config.items,
                  getCategoryName: projectCategoryConfig.getCategoryName,
                  style: ProjectCategoryComponentVariantStyle(
                    variant: ProjectCategoryComponentVariant.light,
                  ),
                  controller: config.controller,
                );
              },
            ),
          )
          .toList(),
    );
  }
}
