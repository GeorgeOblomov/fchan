import 'package:flutter/material.dart';

import '../entities/board.dart';
import '../entities/entity_page.dart';
import '../entities/entity_portion.dart';
import '../entities/thread.dart';
import '../logic/repository/repository.dart';

class CatalogModel extends ChangeNotifier {
  final FChanRepository _fChanRepository;

  CatalogModel(this._fChanRepository);

  Future<EntityPortion<Thread>> catalogPage(Board board, EntityPage entityPage) =>
      _fChanRepository.catalogForBoard(board, entityPage);
}
