import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/project/presentation/widgets/projectListItemComponent/project_item_component.dart';

class ProjectListScreen extends StatelessWidget {
  const ProjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Of Projects", style: boldTextStyle(size: 16))),
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedScrollView(
            listAnimationType: ListAnimationType.None,
            padding: const EdgeInsets.only(bottom: 120, right: 16, left: 16, top: 0),
            children: [
              ProjectItemComponent(
                title: 'Project title',
                description: 'Project Description',
                onTap: () {},
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: CustomButton(
              data: "Create Project",
              onTap: () async {
                //
              },
            ),
          ),
        ],
      ),
    );
  }
}
