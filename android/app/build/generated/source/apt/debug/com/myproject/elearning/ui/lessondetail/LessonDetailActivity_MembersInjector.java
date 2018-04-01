package com.myproject.elearning.ui.lessondetail;

import dagger.MembersInjector;
import javax.annotation.Generated;
import javax.inject.Provider;

@Generated(
  value = "dagger.internal.codegen.ComponentProcessor",
  comments = "https://google.github.io/dagger"
)
public final class LessonDetailActivity_MembersInjector
    implements MembersInjector<LessonDetailActivity> {
  private final Provider<LessonDetailMvpPresenter<LessonDetailBaseView>> mPresenterProvider;

  public LessonDetailActivity_MembersInjector(
      Provider<LessonDetailMvpPresenter<LessonDetailBaseView>> mPresenterProvider) {
    assert mPresenterProvider != null;
    this.mPresenterProvider = mPresenterProvider;
  }

  public static MembersInjector<LessonDetailActivity> create(
      Provider<LessonDetailMvpPresenter<LessonDetailBaseView>> mPresenterProvider) {
    return new LessonDetailActivity_MembersInjector(mPresenterProvider);
  }

  @Override
  public void injectMembers(LessonDetailActivity instance) {
    if (instance == null) {
      throw new NullPointerException("Cannot inject members into a null reference");
    }
    instance.mPresenter = mPresenterProvider.get();
  }

  public static void injectMPresenter(
      LessonDetailActivity instance,
      Provider<LessonDetailMvpPresenter<LessonDetailBaseView>> mPresenterProvider) {
    instance.mPresenter = mPresenterProvider.get();
  }
}
