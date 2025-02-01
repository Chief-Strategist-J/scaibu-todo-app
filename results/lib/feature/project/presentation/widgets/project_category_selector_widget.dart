import 'package:todo_app/core/app_library.dart';

class ProjectCategorySelectorWidget extends HookWidget {
  final ProjectPageParam param;

  const ProjectCategorySelectorWidget(this.param, {super.key});

  Future<void> _showProjectCategorySelector<T>({
    required BuildContext context,
    required String title,
    required List<T> items,
    required String Function(T) getCategoryName,
    required ProjectCategoryComponentVariantStyle style,
    required TextEditingController controller,
  }) async {
    final result = await showModalBottomSheet<T>(
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
              onItemSelected: (selectedItem) => getCategoryName(selectedItem),
              style: style,
            ),
          ),
        );
      },
    );

    if (result != null) {
      controller.text = getCategoryName(result);
    }
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

    final configList = useMemoized(() => projectCategoryConfig.getList(param), [param]);

    return AnimatedScrollView(
      listAnimationType: ListAnimationType.None,
      physics: const NeverScrollableScrollPhysics(),
      children: configList.map((config) {
        return ContentWidget(
          title: config._title,
          controller: config.controller,
          focusNode: config.focusNode,
          isTimeField: true,
          onTap: () {
            hideKeyboard(context);
            _showProjectCategorySelector(
              context: context,
              title: config._title,
              items: config.items,
              getCategoryName: projectCategoryConfig.getCategoryName,
              style: ProjectCategoryComponentVariantStyle(variant: ProjectCategoryComponentVariant.light),
              controller: config.controller,
            );
          },
        );
      }).toList(),
    );
  }
}
