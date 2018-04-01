package com.myproject.elearning.ui.lessoncategories;

import com.myproject.elearning.data.DataManager;
import com.myproject.elearning.utils.rx.SchedulerProvider;
import dagger.MembersInjector;
import dagger.internal.Factory;
import dagger.internal.MembersInjectors;
import io.reactivex.disposables.CompositeDisposable;
import javax.annotation.Generated;
import javax.inject.Provider;

@Generated(
  value = "dagger.internal.codegen.ComponentProcessor",
  comments = "https://google.github.io/dagger"
)
public final class LessonCategoriesPresenter_Factory<V extends LessonCategoriesBaseView>
    implements Factory<LessonCategoriesPresenter<V>> {
  private final MembersInjector<LessonCategoriesPresenter<V>>
      lessonCategoriesPresenterMembersInjector;

  private final Provider<DataManager> dataManagerProvider;

  private final Provider<SchedulerProvider> schedulerProvider;

  private final Provider<CompositeDisposable> compositeDisposableProvider;

  public LessonCategoriesPresenter_Factory(
      MembersInjector<LessonCategoriesPresenter<V>> lessonCategoriesPresenterMembersInjector,
      Provider<DataManager> dataManagerProvider,
      Provider<SchedulerProvider> schedulerProvider,
      Provider<CompositeDisposable> compositeDisposableProvider) {
    assert lessonCategoriesPresenterMembersInjector != null;
    this.lessonCategoriesPresenterMembersInjector = lessonCategoriesPresenterMembersInjector;
    assert dataManagerProvider != null;
    this.dataManagerProvider = dataManagerProvider;
    assert schedulerProvider != null;
    this.schedulerProvider = schedulerProvider;
    assert compositeDisposableProvider != null;
    this.compositeDisposableProvider = compositeDisposableProvider;
  }

  @Override
  public LessonCategoriesPresenter<V> get() {
    return MembersInjectors.injectMembers(
        lessonCategoriesPresenterMembersInjector,
        new LessonCategoriesPresenter<V>(
            dataManagerProvider.get(), schedulerProvider.get(), compositeDisposableProvider.get()));
  }

  public static <V extends LessonCategoriesBaseView> Factory<LessonCategoriesPresenter<V>> create(
      MembersInjector<LessonCategoriesPresenter<V>> lessonCategoriesPresenterMembersInjector,
      Provider<DataManager> dataManagerProvider,
      Provider<SchedulerProvider> schedulerProvider,
      Provider<CompositeDisposable> compositeDisposableProvider) {
    return new LessonCategoriesPresenter_Factory<V>(
        lessonCategoriesPresenterMembersInjector,
        dataManagerProvider,
        schedulerProvider,
        compositeDisposableProvider);
  }
}
