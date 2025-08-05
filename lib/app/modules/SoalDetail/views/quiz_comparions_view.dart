part of 'soal_detail_view.dart';

class QuizMultipleView extends GetView<SoalDetailController> {
  const QuizMultipleView({super.key, required this.model});

  final TapMultiple model;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: model.options
              .map(
                (e) => Obx(
                  () => GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      controller.selectItem(value: e);
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: controller.selectedItem.contains(e)
                            ? ColourPalette.tealColour
                            : ColourPalette.creamColour,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: controller.isLoading.value
                            ? CircularProgressIndicator(
                                color: controller.selectedItem.contains(e)
                                    ? ColourPalette.creamColour
                                    : ColourPalette.tealColour,
                              )
                            : Text(
                                e.toString(),
                                style: CommonUtils.titleStyle.copyWith(
                                  color: controller.selectedItem.contains(e)
                                      ? ColourPalette.creamColour
                                      : ColourPalette.tealColour,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black12,
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () async {
            await controller.submitTapMultipleAnswer(
                context: context, targetValue: model.compareTo);
          },
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(AssetUrls.buttonBackground),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Center(
              child: Text(
                'Selesai',
                style: CommonUtils.headerStyle
                    .copyWith(color: ColourPalette.creamColour),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
