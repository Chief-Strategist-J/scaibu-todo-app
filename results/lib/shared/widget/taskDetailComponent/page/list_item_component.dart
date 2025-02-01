import 'package:todo_app/core/app_library.dart';

/// Doc Required

class ListItemComponent<T> extends StatelessWidget {
  /// Doc Required

  const ListItemComponent({
    required final T entity,
    required final EmptyEntityModel<T> emptyEntity,
    super.key,
  })  : _entity = entity,
        _emptyEntity = emptyEntity;

  final T _entity;
  final EmptyEntityModel<T> _emptyEntity;

  bool _isItemSelected(final BuildContext context) =>
      context.select((final TaskDetailBloc taskDetailBloc) {
        final TaskDetailState currentState = taskDetailBloc.state;
        if (currentState is! TaskDetailDataState) {
          return false;
        }

        if (_emptyEntity.isTag) {
          final String? slug = (_entity as TagEntity).slug;
          return currentState.selectedTagList
              .any((final TagEntity element) => element.slug == slug);
        } else {
          final String? slug = (_entity as ProjectEntity).slug;
          return currentState.selectedProjectList
              .any((final ProjectEntity element) => element.slug == slug);
        }
      });

  @override
  Widget build(final BuildContext context) {
    final bool isItemAlreadySelected = _isItemSelected(context);

    return InkWell(
      onTap: () {
        _emptyEntity.onTap(context, _entity);
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                    Assets.iconIcFilledTag,
                    height: 21,
                    width: 21,
                    colorFilter: ColorFilter.mode(
                      _emptyEntity.isTag
                          ? getIt<UtilityService>().stringToColor(
                              (_entity as TagEntity).color.validate(),
                            )
                          : blackColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  16.width,
                  if (_entity is TagEntity)
                    Text((_entity as TagEntity).name.validate()),
                  if (_entity is ProjectEntity)
                    Text((_entity as ProjectEntity).name.validate()),
                ],
              ),
            ),
            if (isItemAlreadySelected)
              Icon(
                Icons.check,
                color: _emptyEntity.isTag
                    ? getIt<UtilityService>()
                        .stringToColor((_entity as TagEntity).color.validate())
                    : blackColor,
              ),
          ],
        ),
      ),
    );
  }
}
