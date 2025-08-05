part of 'soal_detail_view.dart';

class QuizTapView extends GetView<SoalDetailController> {
  const QuizTapView({super.key, required this.model});

  final Tap model;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: model.options
          .map(
            (e) => Obx(
              () => GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  await controller.submitTapAnswer(
                      context: context, value: e, comparedTo: model.compareTo);
                },
                child: Container(
                  height: 80,
                  width: 80,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: ColourPalette.creamColour,
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
                        ? CircularProgressIndicator()
                        : Text(
                            e.toString(),
                            style: CommonUtils.titleStyle.copyWith(
                              color: ColourPalette.tealColour,
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
    );
  }
}
