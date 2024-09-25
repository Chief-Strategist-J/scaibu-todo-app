import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/project/data/models/project_page_param.dart';

class ProjectPage extends HookWidget {
  final ProjectPageParam?  param;
  const ProjectPage({this.param, super.key});

  @override
  Widget build(BuildContext context) {
    final projectParam = useMemoized(() => param ?? ProjectPageParam(), [param]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Project",
          style: boldTextStyle(size: 16),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedScrollView(
            listAnimationType: ListAnimationType.None,
            padding: const EdgeInsets.only(bottom: 120, right: 16, left: 16, top: 0),
            children: [
              ContentWidget(
                title: 'Project Name',
                controller: TextEditingController(),
                focusNode: FocusNode(),
              ),
              ContentWidget(
                title: 'descriptions'.tr(),
                controller: TextEditingController(),
                focusNode: FocusNode(),
              ),
              ContentWidget(
                title: 'date'.tr(),
                controller: TextEditingController(),
                focusNode: FocusNode(),
                isDateField: true,
                onSelectOfDateOrTime: (p0) {
                  //
                },
                onTap: () async {
                  //
                },
              ),
              ContentWidget(title: 'start_time'.tr(), controller: TextEditingController(), focusNode: FocusNode(), isTimeField: true, onTap: () async {}),
              ContentWidget(
                title: 'end_time'.tr(),
                controller: TextEditingController(),
                focusNode: FocusNode(),
                isTimeField: true,
                onTap: () async {
                  //
                },
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
