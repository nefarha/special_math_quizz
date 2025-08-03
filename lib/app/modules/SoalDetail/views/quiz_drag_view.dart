part of 'soal_detail_view.dart';

class QuizDragView extends GetView<SoalDetailController> {
  const QuizDragView({super.key, required this.model});

  final Drag model;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Flexible(
          child: DragTarget<EObjectType>(
            onAcceptWithDetails: (details) {
              controller.incrementDragValue(isForBasket: false);
            },
            onWillAcceptWithDetails: (details) => true,
            builder: (context, candidateData, rejectedData) => Obx(
              () => Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.teal, width: 5),
                ),
                child: Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      (controller.available.value) + 5,
                      (index) => Draggable<EObjectType>(
                        data: EObjectType.apple,
                        feedback: Image.asset(
                          model.object.images,
                          scale: 0.3,
                          isAntiAlias: false,
                          filterQuality: FilterQuality.none,
                        ),
                        child: Image.asset(
                          model.object.images,
                          scale: 0.7,
                          isAntiAlias: false,
                          filterQuality: FilterQuality.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: DragTarget<EObjectType>(
            onAcceptWithDetails: (details) {
              controller.incrementDragValue(isForBasket: true);
            },
            onWillAcceptWithDetails: (details) => true,
            builder: (context, candidateData, rejectedData) => Obx(
              () => Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColourPalette.creamColour,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.brown, width: 5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown,
                      offset: Offset(0, 30),
                      spreadRadius: 0,
                      blurRadius: 0,
                    )
                  ],
                ),
                height: 150,
                child: Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      (controller.count.value),
                      (index) => Draggable<EObjectType>(
                        data: EObjectType.apple,
                        feedback: Image.asset(
                          model.object.images,
                          scale: 0.3,
                          isAntiAlias: false,
                          filterQuality: FilterQuality.none,
                        ),
                        child: Image.asset(
                          model.object.images,
                          scale: 0.7,
                          isAntiAlias: false,
                          filterQuality: FilterQuality.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Obx(
          () => controller.isLoading.value
              ? const LinearProgressIndicator()
              : GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () async {
                    await controller.submitDragAnswer();
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
        )
      ],
    );
  }
}
