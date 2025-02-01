import 'dart:math' as math;

import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/project/presentation/widgets/create_category_widget.dart';

class ProjectCategorySelectorComponent<T> extends HookWidget {
  final List<T> items;
  final String title;
  final String Function(T) onItemSelected;
  final ProjectCategoryComponentVariantStyle _style;

  const ProjectCategorySelectorComponent({
    required this.items,
    required this.title,
    required this.onItemSelected,
    required ProjectCategoryComponentVariantStyle style,
    super.key,
  }) : _style = style;

  Color _getRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  String get _btnTxt => "Create New Category";

  Future<void> _onCreateCategoryTap(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (context) {
        return CreateCategoryWidget(title: title);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedItem = useState<T?>(null);

    return PressableBox(
      style: _style.dialogStyle(context),
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedScrollView(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              8.height,
              Row(
                children: [
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
                separatorBuilder: (context, index) => const Divider(thickness: 0.5),
                itemBuilder: (context, index) {
                  final item = items[index];
                  final isSelected = selectedItem.value == item;
                  return InkWell(
                    onTap: () {
                      selectedItem.value = item;
                      Navigator.of(context).pop(selectedItem.value);
                    },
                    child: HBox(
                      style: _style.taskPriority(),
                      children: [
                        CircleAvatar(
                          backgroundColor: _getRandomColor(),
                          child: SvgPicture.asset(
                            Assets.iconIcFilledFlag,
                            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                            height: 21,
                            width: 21,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(onItemSelected.call(item)),
                        const Spacer(),
                        if (isSelected) const Icon(Icons.check, color: Colors.green),
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
