import 'package:todo_app/core/app_library.dart';

class ProjectPage extends HookWidget {
  final ProjectPageParam? param;

  const ProjectPage({this.param, super.key});

  void _initProject(ProjectPageParam param) {
    final context = useContext();

    useEffect(() {
      final bloc = context.read<ProjectBloc>();
      bloc.add(InitProjectEvent());

      final currentState = bloc.state;
      if (currentState is InitProjectState) {
        _updateProjectParams(param, currentState.projectCategoryData?.data);
      }

      return null;
    }, []);
  }

  void _updateProjectParams(ProjectPageParam param, ProjectCategoryDataEntity? data) {
    if (data == null) return;

    final mappings = {
      param.listOfProjectCategories: data.categories,
      param.listOfProjectPhases: data.phases,
      param.listOfProjectPriority: data.priorities,
      param.listOfProjectStatuses: data.statuses,
      param.listOfProjectTypes: data.types,
    };

    for (final entry in mappings.entries) {
      _addToParamList(entry.key, entry.value);
    }
  }

  void _addToParamList<T>(List<T> targetList, List<T>? sourceList) {
    if (sourceList != null) {
      targetList.addAll(sourceList);
    }
  }

  @override
  Widget build(BuildContext context) {
    final projectParam = useMemoized(() => param ?? ProjectPageParam(), [param]);
    _initProject(projectParam);

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
                controller: projectParam.projectName,
                focusNode: projectParam.projectNameNode,
              ),
              ContentWidget(
                title: 'Project Description',
                controller: projectParam.projectDescription,
                focusNode: projectParam.projectDescriptionNode,
              ),
              ContentWidget(
                title: 'Project Start Date',
                controller: projectParam.projectStartDate,
                focusNode: projectParam.projectStartDateNode,
                isDateField: true,
                onSelectOfDateOrTime: (p0) {
                  //
                },
                onTap: () async {
                  //
                },
              ),
              ContentWidget(
                title: 'Project End Date',
                controller: projectParam.projectEndDate,
                focusNode: projectParam.projectEndDateNode,
                isTimeField: true,
                onTap: () async {},
              ),
              ContentWidget(
                title: 'Project End Time',
                controller: TextEditingController(),
                focusNode: FocusNode(),
                isTimeField: true,
                onTap: () async {
                  //
                },
              ),
              16.height,
              CustomCheckboxComponent(
                title: "1. Is your project public?",
                onChanged: (value) {
                  projectParam.isPublic = value;
                },
              ),
              CustomCheckboxComponent(
                title: "2. Would you like your project archived?",
                onChanged: (value) {
                  projectParam.isArchived = value;
                },
              ),
              CustomCheckboxComponent(
                title: "3. Is your project featured?",
                onChanged: (value) {
                  projectParam.isFeatured = value;
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

// Define the style class for the CustomCheckboxForProject
