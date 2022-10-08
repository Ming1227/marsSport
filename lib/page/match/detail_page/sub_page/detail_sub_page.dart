import 'package:flutter/material.dart';
import 'package:saturn/saturn.dart';

class DetailSubPage extends StatefulWidget {
  const DetailSubPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailSubPage> createState() => _DetailSubPageState();
}

class _DetailSubPageState extends State<DetailSubPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.separated(
        itemBuilder: (cnt, index) {
          return ListTile(
            leading: Text('$index'),
            title: Center(
              child: Text('detail_sub_page $index'),
            ),
            trailing: const Icon(STIcons.direction_rightoutlined),
          );
        },
        separatorBuilder: (cnt, index) {
          return Container(
            height: 1.0,
            color: Colors.green,
          );
        },
        itemCount: 30,
        cacheExtent: 60.0,
      ),
    );
  }
}
