package com.myproject.elearning.dagger.module;

import com.myproject.elearning.ui.lessondetail.LessonDetailBaseView;
import com.myproject.elearning.ui.lessondetail.LessonDetailMvpPresenter;
import com.myproject.elearning.ui.lessondetail.LessonDetailPresenter;
import dagger.internal.Factory;
import dagger.internal.Preconditions;
import javax.annotation.Generated;
import javax.inject.Provider;

@Generated(
  value = "dagger.internal.codegen.ComponentProcessor",
  comments = "https://google.github.io/dagger"
)
public final class ActivityModule_ProvideLessonDetailPresenterFactory
    implements Factory<LessonDetailMvpPresenter<LessonDetailBaseView>> {
  private final ActivityModule module;

  private final Provider<LessonDetailPresenter<LessonDetailBaseView>> presenterProvider;

  public ActivityModule_ProvideLessonDetailPresenterFactory(
      ActivityModule module,
      Provider<LessonDetailPresenter<LessonDetailBaseView>> presenterProvider) {
    assert module != null;
    this.module = module;
    assert presenterProvider != null;
    this.presenterProvider = presenterProvider;
  }

  @Override
  public LessonDetailMvpPresenter<LessonDetailBaseView> get() {
    return Preconditions.checkNotNull(
        module.provideLessonDetailPresenter(presenterProvider.get()),
        "Cannot return null from a non-@Nullable @Provides method");
  }

  public static Factory<LessonDetailMvpPresenter<LessonDetailBaseView>> create(
      ActivityModule module,
      Provider<LessonDetailPresenter<LessonDetailBaseView>> presenterProvider) {
    return new ActivityModule_ProvideLessonDetailPresenterFactory(module, presenterProvider);
  }

  /** Proxies {@link ActivityModule#provideLessonDetailPresenter(LessonDetailPresenter)}. */
  public static LessonDetailMvpPresenter<LessonDetailBaseView> proxyProvideLessonDetailPresenter(
      ActivityModule instance, LessonDetailPresenter<LessonDetailBaseView> presenter) {
    return instance.provideLessonDetailPresenter(presenter);
  }
}
