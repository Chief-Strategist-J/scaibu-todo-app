import 'dart:math' as math;

import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/project/presentation/widgets/create_category_widget.dart';

/// Doc Required
class ProjectCategorySelectorComponent<T> extends HookWidget {
  /// Doc Required
  const ProjectCategorySelectorComponent({
    required this.items,
    required this.title,
    required this.onItemSelected,
    required final ProjectCategoryComponentVariantStyle style,
    super.key,
  }) : _style = style;

  /// Doc Required
  final List<T> items;

  /// Doc Required
  final String title;

  /// Doc Required
  final String Function(T) onItemSelected;
  final ProjectCategoryComponentVariantStyle _style;

  Color _getRandomColor() =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withValues(
        alpha: 1,
      );

  String get _btnTxt => 'Create New Category';

  Future<void> _onCreateCategoryTap(final BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (final BuildContext context) =>
          CreateCategoryWidget(title: title),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final ValueNotifier<T?> selectedItem = useState<T?>(null);

    return PressableBox(
      style: _style.dialogStyle(context),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          AnimatedScrollView(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              8.height,
              Row(
                children: <Widget>[
                  const Spacer(),
                  Text(title, style: boldTextStyle(size: 20)),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () async {
                      finish(context);
                    },
                  ),
                ],
              ),
              8.height,
              ListView.separated(
                itemCount: items.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder:
                    (final BuildContext context, final int index) =>
                        const Divider(thickness: 0.5),
                itemBuilder: (final BuildContext context, final int index) {
                  final T item = items[index];
                  final bool isSelected = selectedItem.value == item;
                  return InkWell(
                    onTap: () {
                      selectedItem.value = item;
                      Navigator.of(context).pop(selectedItem.value);
                    },
                    child: HBox(
                      style: _style.taskPriority(),
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: _getRandomColor(),
                          child: SvgPicture.asset(
                            Assets.iconIcFilledFlag,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                            height: 21,
                            width: 21,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(onItemSelected.call(item)),
                        const Spacer(),
                        if (isSelected)
                          const Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                      ],
                    ),
                  );
                },
              ),
              16.height,
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: CustomButton(
              data: _btnTxt,
              onTap: () async {
                await _onCreateCategoryTap(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
