package com.myproject.elearning.dagger.module;

import com.myproject.elearning.ui.lessoncategories.LessonCategoriesBaseView;
import com.myproject.elearning.ui.lessoncategories.LessonCategoriesMvpPresenter;
import com.myproject.elearning.ui.lessoncategories.LessonCategoriesPresenter;
import dagger.internal.Factory;
import dagger.internal.Preconditions;
import javax.annotation.Generated;
import javax.inject.Provider;

@Generated(
  value = "dagger.internal.codegen.ComponentProcessor",
  comments = "https://google.github.io/dagger"
)
public final class ActivityModule_ProvideLessonCategoriesPresenterFactory
    implements Factory<LessonCategoriesMvpPresenter<LessonCategoriesBaseView>> {
  private final ActivityModule module;

  private final Provider<LessonCategoriesPresenter<LessonCategoriesBaseView>> presenterProvider;

  public ActivityModule_ProvideLessonCategoriesPresenterFactory(
      ActivityModule module,
      Provider<LessonCategoriesPresenter<LessonCategoriesBaseView>> presenterProvider) {
    assert module != null;
    this.module = module;
    assert presenterProvider != null;
    this.presenterProvider = presenterProvider;
  }

  @Override
  public LessonCategoriesMvpPresenter<LessonCategoriesBaseView> get() {
    return Preconditions.checkNotNull(
        module.provideLessonCategoriesPresenter(presenterProvider.get()),
        "Cannot return null from a non-@Nullable @Provides method");
  }

  public static Factory<LessonCategoriesMvpPresenter<LessonCategoriesBaseView>> create(
      ActivityModule module,
      Provider<LessonCategoriesPresenter<LessonCategoriesBaseView>> presenterProvider) {
    return new ActivityModule_ProvideLessonCategoriesPresenterFactory(module, presenterProvider);
  }

  /** Proxies {@link ActivityModule#provideLessonCategoriesPresenter(LessonCategoriesPresenter)}. */
  public static LessonCategoriesMvpPresenter<LessonCategoriesBaseView>
      proxyProvideLessonCategoriesPresenter(
          ActivityModule instance, LessonCategoriesPresenter<LessonCategoriesBaseView> presenter) {
    return instance.provideLessonCategoriesPresenter(presenter);
  }
}
