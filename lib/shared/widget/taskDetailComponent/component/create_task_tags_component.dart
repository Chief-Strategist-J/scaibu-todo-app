import 'package:todo_app/core/app_library.dart';

class CreateTaskTagsComponent extends StatelessWidget {
  final TaskDetailComponentVariantStyle _style;

  const CreateTaskTagsComponent({required TaskDetailComponentVariantStyle style, super.key}) : _style = style;

  @override
  Widget build(BuildContext context) {
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
              return TagListComponent(tag);
            },
          ),
          16.height,
        ],
      ),
    );
  }
}
