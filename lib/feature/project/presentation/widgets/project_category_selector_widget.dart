import 'package:todo_app/core/app_library.dart';

class ProjectCategorySelectorWidget extends HookWidget {
  final ProjectPageParam param;

  const ProjectCategorySelectorWidget(this.param, {super.key});

  Future<void> _showProjectCategorySelector<T>({
    required BuildContext context,
    required String title,
    required List<T> items,
    required String Function(T) onItemSelected,
    required ProjectCategoryComponentVariantStyle style,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return BlocProvider.value(
          value: context.read<ProjectBloc>(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ProjectCategorySelectorComponent<T>(
              title: title,
              items: items,
              onItemSelected: onItemSelected,
              style: style,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final projectCategoryConfig = useMemoized(() {
      return ProjectCategoryConfig(
        title: '',
        items: [],
        controller: TextEditingController(),
        focusNode: FocusNode(),
      );
    }, [param]);

    return AnimatedScrollView(
      listAnimationType: ListAnimationType.None,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ...projectCategoryConfig.getList(param).map((config) {
          return ContentWidget(
            title: config.title,
            controller: config.controller,
            focusNode: config.focusNode,
            isTimeField: true,
            onTap: () {
              _showProjectCategorySelector(
                context: context,
                title: config.title,
                items: config.items,
                onItemSelected: (p0) {
                  config.controller.text = projectCategoryConfig.getCategoryName(p0);
                  return config.controller.text;
                },
                style: ProjectCategoryComponentVariantStyle(variant: ProjectCategoryComponentVariant.light),
              );
            },
          );
        })
      ],
    );
  }
}
