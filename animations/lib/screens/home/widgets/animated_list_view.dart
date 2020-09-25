import 'package:animations/screens/home/widgets/list_data.dart';
import 'package:flutter/material.dart';

class AnimatedListView extends StatelessWidget {
  final Animation<EdgeInsets> listSlidePosition;

  AnimatedListView({@required this.listSlidePosition});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ListData(
          title: 'Estudar Flutter',
          subtitle: 'Com o curso do Daniel Ciolfi',
          image: AssetImage('images/perfil.jpg'),
          margin: listSlidePosition.value * 6,
        ),
        ListData(
          title: 'Estudar Flutter',
          subtitle: 'Com o curso do Daniel Ciolfi',
          image: AssetImage('images/perfil.jpg'),
          margin: listSlidePosition.value * 5,
        ),
        ListData(
          title: 'Estudar Flutter',
          subtitle: 'Com o curso do Daniel Ciolfi',
          image: AssetImage('images/perfil.jpg'),
          margin: listSlidePosition.value * 4,
        ),
        ListData(
          title: 'Estudar Flutter',
          subtitle: 'Com o curso do Daniel Ciolfi',
          image: AssetImage('images/perfil.jpg'),
          margin: listSlidePosition.value * 3,
        ),
        ListData(
          title: 'Estudar Flutter',
          subtitle: 'Com o curso do Daniel Ciolfi',
          image: AssetImage('images/perfil.jpg'),
          margin: listSlidePosition.value * 2,
        ),
        ListData(
          title: 'Estudar Flutter',
          subtitle: 'Com o curso do Daniel Ciolfi',
          image: AssetImage('images/perfil.jpg'),
          margin: listSlidePosition.value * 1,
        ),
        ListData(
          title: 'Estudar Flutter',
          subtitle: 'Com o curso do Daniel Ciolfi',
          image: AssetImage('images/perfil.jpg'),
          margin: listSlidePosition.value * 0,
        ),
      ],
    );
  }
}
