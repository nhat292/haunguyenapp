package com.myproject.elearning.ui.lessoncategories;

import dagger.MembersInjector;
import javax.annotation.Generated;
import javax.inject.Provider;

@Generated(
  value = "dagger.internal.codegen.ComponentProcessor",
  comments = "https://google.github.io/dagger"
)
public final class LessonCategoriesFragment_MembersInjector
    implements MembersInjector<LessonCategoriesFragment> {
  private final Provider<LessonCategoriesMvpPresenter<LessonCategoriesBaseView>> mPresenterProvider;

  public LessonCategoriesFragment_MembersInjector(
      Provider<LessonCategoriesMvpPresenter<LessonCategoriesBaseView>> mPresenterProvider) {
    assert mPresenterProvider != null;
    this.mPresenterProvider = mPresenterProvider;
  }

  public static MembersInjector<LessonCategoriesFragment> create(
      Provider<LessonCategoriesMvpPresenter<LessonCategoriesBaseView>> mPresenterProvider) {
    return new LessonCategoriesFragment_MembersInjector(mPresenterProvider);
  }

  @Override
  public void injectMembers(LessonCategoriesFragment instance) {
    if (instance == null) {
      throw new NullPointerException("Cannot inject members into a null reference");
    }
    instance.mPresenter = mPresenterProvider.get();
  }

  public static void injectMPresenter(
      LessonCategoriesFragment instance,
      Provider<LessonCategoriesMvpPresenter<LessonCategoriesBaseView>> mPresenterProvider) {
    instance.mPresenter = mPresenterProvider.get();
  }
}
