import 'dart:math' as Math; // Import for random number generation

import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/project/presentation/widgets/projectCategorySelectorComponent/project_category_component.style.dart';

class CategoryModel {
  final String title;
  final String code;

  CategoryModel({required this.title, required this.code});
}

class ProjectCategorySelectorComponent extends StatelessWidget {
  final List<CategoryModel> categories; // Assuming you have a CategoryModel
  final Function(CategoryModel) onCategorySelected;
  final ProjectCategoryComponentVariantStyle _style; // Updated to the new style class

  const ProjectCategorySelectorComponent({
    required this.categories,
    required this.onCategorySelected,
    required ProjectCategoryComponentVariantStyle style, // Using the new style
    super.key,
  }) : _style = style;

  void _onTapOfCategory(BuildContext context, CategoryModel category) {
    onCategorySelected(category); // Return selected category
    GoRouter.of(context).pop(); // Navigate back or close the dialog
  }

  Color _getRandomColor() {
    return Color((Math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return PressableBox(
      style: _style.dialogStyle(context),
      child: AnimatedScrollView(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Center(child: Text("Select Category", style: boldTextStyle(size: 20))),
          ListView.separated(
            itemCount: categories.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => const Divider(thickness: 0.5),
            itemBuilder: (context, index) {
              final category = categories[index];

              return InkWell(
                onTap: () {
                  _onTapOfCategory(context, category);
                },
                child: HBox(
                  style: _style.taskPriority(),
                  children: [
                    CircleAvatar(
                      backgroundColor: _getRandomColor(), // Random color for the background
                      child: SvgPicture.asset(
                        Assets.iconIcFilledFlag, // Your icon asset
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        height: 21,
                        width: 21,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(category.title), // Assuming `title` is a property of CategoryModel
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
