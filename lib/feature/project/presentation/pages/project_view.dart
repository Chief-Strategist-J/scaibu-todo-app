import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/project/presentation/widgets/project_category_selector_widget.dart';

/// Doc Required

class ProjectPage extends HookWidget {
  /// Doc Required

  const ProjectPage({this.param, super.key});

  /// Doc Required
  final ProjectPageParam? param;

  void _initProject(final BuildContext context, final ProjectPageParam param) {
    useEffect(
      () async {
        final ProjectBloc bloc = context.read<ProjectBloc>();
        final Completer<void> completer = Completer<void>();

        bloc.add(InitProjectEvent());

        final StreamSubscription<ProjectState> subscription =
            bloc.stream.listen((final ProjectState state) {
          if (state is InitProjectState) {
            completer.complete();
          }
        });

        await completer.future.then((final _) {
          final ProjectState currentState = bloc.state;
          if (currentState is InitProjectState) {
            _updateProjectParams(
              param,
              currentState.projectCategoryData?.data,
            );
          }
        });

        return subscription.cancel;
      } as Dispose? Function(),
      <Object?>[],
    );
  }

  void _updateProjectParams(
    final ProjectPageParam param,
    final ProjectCategoryDataEntity? data,
  ) {
    if (data == null) {
      return;
    }

    final Map<List<Object>, List<Object>?> mappings =
        <List<Object>, List<Object>?>{
      param.listOfProjectCategories: data.categories,
      param.listOfProjectPhases: data.phases,
      param.listOfProjectPriority: data.priorities,
      param.listOfProjectStatuses: data.statuses,
      param.listOfProjectTypes: data.types,
    };

    for (final MapEntry<List<Object>, List<Object>?> entry
        in mappings.entries) {
      _addToParamList(entry.key, entry.value);
    }
  }

  void _addToParamList<T>(final List<T> targetList, final List<T>? sourceList) {
    if (sourceList != null) {
      targetList.addAll(sourceList);
    }
  }

  Future<void> _selectEstimatedHours(
    final BuildContext context,
    final ProjectPageParam projectParam,
  ) async {
    await timeService
        .selectTimeRange(context)
        .then((final TimeServiceModel time) async {
      if (!context.mounted) {
        return;
      }
      projectParam.projectEstimatedHours.text =
          time.formatedStringTimeDuration.validate();
      projectParam.estimatedHours = time;
    });
  }

  Future<void> _selectActualHours(
    final BuildContext context,
    final ProjectPageParam projectParam,
  ) async {
    await timeService
        .selectTimeRange(context)
        .then((final TimeServiceModel time) async {
      if (!context.mounted) {
        return;
      }
      projectParam.projectActualHours.text =
          time.formatedStringTimeDuration.validate();
      projectParam.actualHours = time;
    });
  }

  void _createProject(
    final ProjectPageParam projectParam,
    final BuildContext context,
  ) {
    context.read<ProjectBloc>().add(CreateProjectEvent(request: projectParam));
  }

  @override
  Widget build(final BuildContext context) {
    final ProjectPageParam projectParam =
        useMemoized(() => param ?? ProjectPageParam(), <Object?>[param]);
    _initProject(context, projectParam);

    final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('New Project', style: boldTextStyle(size: 16)),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          AnimatedScrollView(
            listAnimationType: ListAnimationType.None,
            padding: const EdgeInsets.only(
              bottom: 120,
              right: 16,
              left: 16,
            ),
            children: <Widget>[
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
                  await timeService
                      .selectDate(context)
                      .then((final TimeServiceModel date) async {
                    if (!context.mounted) {
                      return;
                    }
                    projectParam.projectStartDate.text =
                        date.formatTimeInString;
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
                  await timeService
                      .selectDate(context)
                      .then((final TimeServiceModel date) async {
                    if (!context.mounted) {
                      return;
                    }
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
                title: '1. Is your project public?',
                onChanged: (final bool value) {
                  projectParam.isPublic = value;
                },
              ),
              CustomCheckboxComponent(
                title: '2. Would you like your project archived?',
                onChanged: (final bool value) {
                  projectParam.isArchived = value;
                },
              ),
              CustomCheckboxComponent(
                title: '3. Is your project featured?',
                onChanged: (final bool value) {
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
                data: 'Create Project',
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
