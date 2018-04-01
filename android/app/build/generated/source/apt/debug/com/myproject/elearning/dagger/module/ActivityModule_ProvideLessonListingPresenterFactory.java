package com.myproject.elearning.dagger.module;

import com.myproject.elearning.ui.lessonlisting.LessonListingBaseView;
import com.myproject.elearning.ui.lessonlisting.LessonListingMvpPresenter;
import com.myproject.elearning.ui.lessonlisting.LessonListingPresenter;
import dagger.internal.Factory;
import dagger.internal.Preconditions;
import javax.annotation.Generated;
import javax.inject.Provider;

@Generated(
  value = "dagger.internal.codegen.ComponentProcessor",
  comments = "https://google.github.io/dagger"
)
public final class ActivityModule_ProvideLessonListingPresenterFactory
    implements Factory<LessonListingMvpPresenter<LessonListingBaseView>> {
  private final ActivityModule module;

  private final Provider<LessonListingPresenter<LessonListingBaseView>> presenterProvider;

  public ActivityModule_ProvideLessonListingPresenterFactory(
      ActivityModule module,
      Provider<LessonListingPresenter<LessonListingBaseView>> presenterProvider) {
    assert module != null;
    this.module = module;
    assert presenterProvider != null;
    this.presenterProvider = presenterProvider;
  }

  @Override
  public LessonListingMvpPresenter<LessonListingBaseView> get() {
    return Preconditions.checkNotNull(
        module.provideLessonListingPresenter(presenterProvider.get()),
        "Cannot return null from a non-@Nullable @Provides method");
  }

  public static Factory<LessonListingMvpPresenter<LessonListingBaseView>> create(
      ActivityModule module,
      Provider<LessonListingPresenter<LessonListingBaseView>> presenterProvider) {
    return new ActivityModule_ProvideLessonListingPresenterFactory(module, presenterProvider);
  }

  /** Proxies {@link ActivityModule#provideLessonListingPresenter(LessonListingPresenter)}. */
  public static LessonListingMvpPresenter<LessonListingBaseView> proxyProvideLessonListingPresenter(
      ActivityModule instance, LessonListingPresenter<LessonListingBaseView> presenter) {
    return instance.provideLessonListingPresenter(presenter);
  }
}
