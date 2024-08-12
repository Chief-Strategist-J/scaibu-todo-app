import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/core/utils/utility_service.dart';

class CreateTaskTagsComponent extends HookWidget {
  final TaskDetailComponentVariantStyle _style;

  const CreateTaskTagsComponent({required TaskDetailComponentVariantStyle style, super.key}) : _style = style;

  @override
  Widget build(BuildContext context) {
    final utilityService = useMemoized(() => getIt<UtilityService>());

    final List<TagEntity> _list = context.select((TaskDetailBloc value) {
      final state = value.state;
      return state is TaskDetailDataState ? state.tagList : [];
    });

    return PressableBox(
      style: _style.dialogStyle(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          8.height,
          Center(child: Text("Tags", style: boldTextStyle(size: 20))),
          ListView.separated(
            itemCount: _list.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) => const Divider(thickness: 0.5),
            itemBuilder: (context, index) {
              final tag = _list[index];

              return InkWell(
                onTap: () {
                  //
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.iconIcFilledTag,
                        color: utilityService.stringToColor(tag.color ?? '0xFFFFEBEE'),
                        height: 21,
                        width: 21,
                      ),
                      16.width,
                      Text(tag.name.validate()),
                    ],
                  ),
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
