import 'package:todo_app/core/app_library.dart';

class TagInputField extends StatelessWidget {
  const TagInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final tagBloc = context.read<TagBloc>();

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: ContentWidget(
        title: 'Tag Name',
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14),
          child: SvgPicture.asset(
            Assets.iconIcTag,
            width: 16,
            height: 16,
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(cardColor.withValues(alpha :0.3), BlendMode.srcIn),
          ),
        ),
        controller: tagBloc.tagTextEditingController,
        focusNode: tagBloc.tagTextFocusNode,
      ),
    );
  }
}
