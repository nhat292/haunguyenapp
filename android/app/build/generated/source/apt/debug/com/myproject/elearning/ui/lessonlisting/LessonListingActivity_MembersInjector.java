package com.myproject.elearning.ui.lessonlisting;

import dagger.MembersInjector;
import javax.annotation.Generated;
import javax.inject.Provider;

@Generated(
  value = "dagger.internal.codegen.ComponentProcessor",
  comments = "https://google.github.io/dagger"
)
public final class LessonListingActivity_MembersInjector
    implements MembersInjector<LessonListingActivity> {
  private final Provider<LessonListingMvpPresenter<LessonListingBaseView>> mPresenterProvider;

  public LessonListingActivity_MembersInjector(
      Provider<LessonListingMvpPresenter<LessonListingBaseView>> mPresenterProvider) {
    assert mPresenterProvider != null;
    this.mPresenterProvider = mPresenterProvider;
  }

  public static MembersInjector<LessonListingActivity> create(
      Provider<LessonListingMvpPresenter<LessonListingBaseView>> mPresenterProvider) {
    return new LessonListingActivity_MembersInjector(mPresenterProvider);
  }

  @Override
  public void injectMembers(LessonListingActivity instance) {
    if (instance == null) {
      throw new NullPointerException("Cannot inject members into a null reference");
    }
    instance.mPresenter = mPresenterProvider.get();
  }

  public static void injectMPresenter(
      LessonListingActivity instance,
      Provider<LessonListingMvpPresenter<LessonListingBaseView>> mPresenterProvider) {
    instance.mPresenter = mPresenterProvider.get();
  }
}
