import 'dart:math' as math; // Import for random number generation

import 'package:todo_app/core/app_library.dart';

class ProjectCategorySelectorComponent<T> extends StatelessWidget {
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

  void _onTapOfItem(BuildContext context, T item) {
    onItemSelected(item);
    GoRouter.of(context).pop();
  }

  Color _getRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return PressableBox(
      style: _style.dialogStyle(context),
      child: AnimatedScrollView(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          8.height,
          Center(child: Text(title, style: boldTextStyle(size: 20))),
          8.height,
          ListView.separated(
            itemCount: items.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => const Divider(thickness: 0.5),
            itemBuilder: (context, index) {
              final item = items[index];
              return InkWell(
                onTap: () {
                  _onTapOfItem(context, item);
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
                  ],
                ),
              );
            },
          ),
          16.height,
        ],
      ),
    );
  }
}