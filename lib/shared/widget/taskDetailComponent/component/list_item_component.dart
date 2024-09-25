import 'package:todo_app/core/app_library.dart';

class ListItemComponent<T> extends StatelessWidget {
  final T entity;
  final EmptyEntityModel<T> emptyEntity;

  const ListItemComponent({required this.entity, required this.emptyEntity, super.key});

  bool _isItemSelected(BuildContext context) {
    return context.select((TaskDetailBloc taskDetailBloc) {
      final currentState = taskDetailBloc.state;
      if (currentState is! TaskDetailDataState) return false;

      if (emptyEntity.isTag) {
        final slug = (entity as TagEntity).slug;
        return currentState.selectedTagList.any((element) => element.slug == slug);
      } else {
        final slug = (entity as ProjectEntity).slug;
        return currentState.selectedProjectList.any((element) => element.slug == slug);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isItemAlreadySelected = _isItemSelected(context);

    return InkWell(
      onTap: () {
        emptyEntity.onTap(context, entity);
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.iconIcFilledTag,
                    height: 21,
                    width: 21,
                    colorFilter: ColorFilter.mode(
                      emptyEntity.isTag ? getIt<UtilityService>().stringToColor((entity as TagEntity).color.validate()) : blackColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  16.width,
                  if (entity is TagEntity) Text((entity as TagEntity).name.validate()),
                  if (entity is ProjectEntity) Text((entity as ProjectEntity).name.validate()),
                ],
              ),
            ),
            if (isItemAlreadySelected) Icon(Icons.check, color: emptyEntity.isTag ? getIt<UtilityService>().stringToColor((entity as TagEntity).color.validate()) : blackColor),
          ],
        ),
      ),
    );
  }
}
