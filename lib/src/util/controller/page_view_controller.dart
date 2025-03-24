import 'package:flutter/material.dart';
import 'package:images_app/src/util/enums/pages_enum.dart';

class PageViewController {
  static final pageselected = ValueNotifier<PagesEnum>(PagesEnum.home);

  void changePage(PagesEnum pages) {
    pageselected.value = pages;
  }
}
