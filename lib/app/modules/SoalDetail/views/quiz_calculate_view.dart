part of 'soal_detail_view.dart';

class QuizCalculateView extends GetView<SoalDetailController> {
  const QuizCalculateView({super.key, required this.model});

  final Calculate model;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        spacing: 20,
        children: [
          TextField(
            controller: controller.answerController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColourPalette.tealColour,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: 'tulis jawabanmu disini',
            ),
          ),
          controller.isLoading.value
              ? LinearProgressIndicator(
                  color: ColourPalette.tealColour,
                )
              : GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () async {
                    await controller.submitCalculateAnswer(context: context);
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
      ),
    );
  }
}
