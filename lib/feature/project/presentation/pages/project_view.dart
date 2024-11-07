import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/project/presentation/widgets/project_category_selector_widget.dart';

class ProjectPage extends HookWidget {
  final ProjectPageParam? param;

  const ProjectPage({this.param, super.key});

  void _initProject(BuildContext context, ProjectPageParam param) {
    useEffect(() {
      final bloc = context.read<ProjectBloc>();
      final completer = Completer<void>();

      bloc.add(InitProjectEvent());

      final subscription = bloc.stream.listen((state) {
        if (state is InitProjectState) {
          completer.complete();
        }
      });

      completer.future.then((_) {
        final currentState = bloc.state;
        if (currentState is InitProjectState) {
          _updateProjectParams(param, currentState.projectCategoryData?.data);
        }
      });

      return () {
        subscription.cancel();
      };
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

  Future<void> _selectEstimatedHours(BuildContext context, ProjectPageParam projectParam) async {
    await timeService.selectTimeRange(context).then((time) async {
      if (!context.mounted) return;
      projectParam.projectEstimatedHours.text = time.formatedStringTimeDuration.validate();
      projectParam.estimatedHours = time;
    });
  }

  Future<void> _selectActualHours(BuildContext context, ProjectPageParam projectParam) async {
    await timeService.selectTimeRange(context).then((time) async {
      if (!context.mounted) return;
      projectParam.projectActualHours.text = time.formatedStringTimeDuration.validate();
      projectParam.actualHours = time;
    });
  }

  void _createProject(ProjectPageParam projectParam, BuildContext context) {
    final req = {
      "name": projectParam.projectName.text,
      "description": projectParam.projectDescription.text,
      "status": projectParam.projectStatus.text,
      "end_date": projectParam.endDate?.dateTime.toIso8601String(),
      "is_public": projectParam.isPublic,
      "created_by": userCredentials.getUserId,
      "updated_by": userCredentials.getUserId,
      "project_category_name": projectParam.projectCategory.text,
      "project_phase_name": projectParam.projectPhase.text,
      "project_status_name": projectParam.projectStatus.text,
      "project_priority_name": projectParam.projectPriority.text,
      "project_type_name": projectParam.projectProjectType.text,
    };
    context.read<ProjectBloc>().add(CreateProjectEvent(request: req));
  }

  @override
  Widget build(BuildContext context) {
    final projectParam = useMemoized(() => param ?? ProjectPageParam(), [param]);
    _initProject(context, projectParam);
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      appBar: AppBar(title: Text("New Project", style: boldTextStyle(size: 16))),
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
                title: 'Project Start Date',
                controller: projectParam.projectStartDate,
                focusNode: projectParam.projectStartDateNode,
                isDateField: true,
                onTap: () async {
                  hideKeyboard(context);
                  await timeService.selectDate(context).then((date) async {
                    if (!context.mounted) return;
                    projectParam.projectStartDate.text = date.formatTimeInString;
                    projectParam.startDate = date;
                  });
                },
              ),
              ContentWidget(
                title: 'Project End Date',
                controller: projectParam.projectEndDate,
                focusNode: projectParam.projectEndDateNode,
                isTimeField: true,
                onTap: () async {
                  hideKeyboard(context);
                  await timeService.selectDate(context).then((date) async {
                    if (!context.mounted) return;
                    projectParam.projectEndDate.text = date.formatTimeInString;
                    projectParam.endDate = date;
                  });
                },
              ),
              ContentWidget(
                title: 'Project Estimated Hours',
                controller: projectParam.projectEstimatedHours,
                focusNode: projectParam.projectEstimatedHoursNode,
                isTimeField: true,
                onTap: () async {
                  hideKeyboard(context);
                  await _selectEstimatedHours(context, projectParam);
                },
              ),
              ContentWidget(
                title: 'Project Actual Hours',
                controller: projectParam.projectActualHours,
                focusNode: projectParam.projectActualHoursNode,
                isTimeField: true,
                onTap: () async {
                  hideKeyboard(context);
                  await _selectActualHours(context, projectParam);
                },
              ),
              ProjectCategorySelectorWidget(projectParam),
              ContentWidget(
                title: 'Project Description',
                controller: projectParam.projectDescription,
                focusNode: projectParam.projectDescriptionNode,
                lines: 10,
              ),
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
          if (!isKeyboardVisible)
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: CustomButton(
                data: "Create Project",
                onTap: () async {
                  _createProject(projectParam, context);
                },
              ),
            ),
        ],
      ),
    );
  }
}
