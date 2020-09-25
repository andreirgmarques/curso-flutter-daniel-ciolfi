import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/components/custom_drawer/page_tile.dart';
import 'package:xlo_mobx/stores/page_store.dart';

class PageSection extends StatelessWidget {
  final PageStore _pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Anúncios',
          iconData: Icons.list,
          onTap: () => _pageStore.setPage(0),
          highlighted: _pageStore.page == 0,
        ),
        PageTile(
          label: 'Inserir Anúncio',
          iconData: Icons.edit,
          onTap: () => _pageStore.setPage(1),
          highlighted: _pageStore.page == 1,
        ),
        PageTile(
          label: 'Chat',
          iconData: Icons.chat,
          onTap: () => _pageStore.setPage(2),
          highlighted: _pageStore.page == 2,
        ),
        PageTile(
          label: 'Favoritos',
          iconData: Icons.favorite,
          onTap: () => _pageStore.setPage(3),
          highlighted: _pageStore.page == 3,
        ),
        PageTile(
          label: 'Minha Conta',
          iconData: Icons.person,
          onTap: () => _pageStore.setPage(4),
          highlighted: _pageStore.page == 4,
        ),
      ],
    );
  }
}
