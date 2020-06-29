import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hotcloud/api/base_state.dart';
import 'package:hotcloud/api/http.dart';
import 'package:hotcloud/common/base_view_model.dart';
import 'package:hotcloud/common/urls.dart';
import 'package:hotcloud/model/subject_entity.dart';

class SubjectsViewModel extends BaseViewModel {
  SubjectEntity subjectEntity;

  load() {
    state = BaseState.LOADING;
    notifyListeners();

    Http().get(
      Urls.SEARCH_SUBJECTS,
      {},
      success: (json) {
        /// 开辟子线程
        compute(decode, json).then((value) {
          if (value == null) {
            state = BaseState.EMPTY;
          } else {
            subjectEntity = value;
            state = BaseState.CONTENT;
          }
          notifyListeners();
        });
      },
      fail: (reason, statuscode) {
        state = BaseState.FAIL;
        notifyListeners();
      },
      after: () {},
    );
  }

  static SubjectEntity decode(dynamic json) {
    return SubjectEntity.fromJson(json);
  }
}
