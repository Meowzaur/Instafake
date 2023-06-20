import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  late OverlayEntry _popupDialog;
  List<String> imageUrls = [
    'https://www.azcentral.com/gcdn/-mm-/fd5c5b5393c72a785789f0cd5bd20acedd2d2804/c=0-350-2659-1850/local/-/media/Phoenix/BillGoodykoontz/2014/04/24//1398388295000-Homer-Simpson.jpg',
    'https://images.ecestaticos.com/-Q5QNhhKfbAIvzoyjfO8HtQ7vSs=/0x0:2121x1414/1200x900/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F373%2F36b%2F9fe%2F37336b9fec6260fc47daec617570c067.jpg',
    'https://www.azcentral.com/gcdn/-mm-/fd5c5b5393c72a785789f0cd5bd20acedd2d2804/c=0-350-2659-1850/local/-/media/Phoenix/BillGoodykoontz/2014/04/24//1398388295000-Homer-Simpson.jpg',
    'https://images.ecestaticos.com/-Q5QNhhKfbAIvzoyjfO8HtQ7vSs=/0x0:2121x1414/1200x900/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F373%2F36b%2F9fe%2F37336b9fec6260fc47daec617570c067.jpg',
    'https://www.azcentral.com/gcdn/-mm-/fd5c5b5393c72a785789f0cd5bd20acedd2d2804/c=0-350-2659-1850/local/-/media/Phoenix/BillGoodykoontz/2014/04/24//1398388295000-Homer-Simpson.jpg',
    'https://images.ecestaticos.com/-Q5QNhhKfbAIvzoyjfO8HtQ7vSs=/0x0:2121x1414/1200x900/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F373%2F36b%2F9fe%2F37336b9fec6260fc47daec617570c067.jpg',
    'https://www.azcentral.com/gcdn/-mm-/fd5c5b5393c72a785789f0cd5bd20acedd2d2804/c=0-350-2659-1850/local/-/media/Phoenix/BillGoodykoontz/2014/04/24//1398388295000-Homer-Simpson.jpg',
    'https://images.ecestaticos.com/-Q5QNhhKfbAIvzoyjfO8HtQ7vSs=/0x0:2121x1414/1200x900/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F373%2F36b%2F9fe%2F37336b9fec6260fc47daec617570c067.jpg',
    'https://www.azcentral.com/gcdn/-mm-/fd5c5b5393c72a785789f0cd5bd20acedd2d2804/c=0-350-2659-1850/local/-/media/Phoenix/BillGoodykoontz/2014/04/24//1398388295000-Homer-Simpson.jpg',
    'https://images.ecestaticos.com/-Q5QNhhKfbAIvzoyjfO8HtQ7vSs=/0x0:2121x1414/1200x900/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F373%2F36b%2F9fe%2F37336b9fec6260fc47daec617570c067.jpg',
    'https://www.azcentral.com/gcdn/-mm-/fd5c5b5393c72a785789f0cd5bd20acedd2d2804/c=0-350-2659-1850/local/-/media/Phoenix/BillGoodykoontz/2014/04/24//1398388295000-Homer-Simpson.jpg',
    'https://images.ecestaticos.com/-Q5QNhhKfbAIvzoyjfO8HtQ7vSs=/0x0:2121x1414/1200x900/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F373%2F36b%2F9fe%2F37336b9fec6260fc47daec617570c067.jpg',
    'https://www.azcentral.com/gcdn/-mm-/fd5c5b5393c72a785789f0cd5bd20acedd2d2804/c=0-350-2659-1850/local/-/media/Phoenix/BillGoodykoontz/2014/04/24//1398388295000-Homer-Simpson.jpg',
    'https://images.ecestaticos.com/-Q5QNhhKfbAIvzoyjfO8HtQ7vSs=/0x0:2121x1414/1200x900/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F373%2F36b%2F9fe%2F37336b9fec6260fc47daec617570c067.jpg',
    'https://www.azcentral.com/gcdn/-mm-/fd5c5b5393c72a785789f0cd5bd20acedd2d2804/c=0-350-2659-1850/local/-/media/Phoenix/BillGoodykoontz/2014/04/24//1398388295000-Homer-Simpson.jpg',
    'https://images.ecestaticos.com/-Q5QNhhKfbAIvzoyjfO8HtQ7vSs=/0x0:2121x1414/1200x900/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F373%2F36b%2F9fe%2F37336b9fec6260fc47daec617570c067.jpg',
    'https://www.azcentral.com/gcdn/-mm-/fd5c5b5393c72a785789f0cd5bd20acedd2d2804/c=0-350-2659-1850/local/-/media/Phoenix/BillGoodykoontz/2014/04/24//1398388295000-Homer-Simpson.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        children: imageUrls.map(_createGridTileWidget).toList(),
      ),
    );
  }

  Widget _createGridTileWidget(String url) => Builder(
        builder: (context) => GestureDetector(
          onLongPress: () {
            _popupDialog = _createPopupDialog(url);
            Overlay.of(context)?.insert(_popupDialog);
          },
          onLongPressEnd: (details) => _popupDialog.remove(),
          child: Image.network(url, fit: BoxFit.cover),
        ),
      );

  OverlayEntry _createPopupDialog(String url) {
    return OverlayEntry(
      builder: (context) => AnimatedDialog(
        child: _createPopupContent(url),
      ),
    );
  }

  Widget _createPhotoTitle() => Container(
      width: double.infinity,
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://static.wikia.nocookie.net/doblaje/images/a/a8/Justo_-_SD_conoce_a_Coraje.jpg/revision/latest?cb=20210916154610&path-prefix=es'),
        ),
        title: Text(
          'jeffrey_gerson',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ));

  Widget _createActionBar() => Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
            Icon(
              Icons.chat_bubble_outline_outlined,
              color: Colors.black,
            ),
            Icon(
              Icons.send,
              color: Colors.black,
            ),
          ],
        ),
      );

  Widget _createPopupContent(String url) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _createPhotoTitle(),
              Image.network(url, fit: BoxFit.fitWidth),
              _createActionBar(),
            ],
          ),
        ),
      );
}

class AnimatedDialog extends StatefulWidget {
  const AnimatedDialog({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() => AnimatedDialogState();
}

class AnimatedDialogState extends State<AnimatedDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacityAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo);
    opacityAnimation = Tween<double>(begin: 0.0, end: 0.6).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo));

    controller.addListener(() => setState(() {}));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(opacityAnimation.value),
      child: Center(
        child: FadeTransition(
          opacity: scaleAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
