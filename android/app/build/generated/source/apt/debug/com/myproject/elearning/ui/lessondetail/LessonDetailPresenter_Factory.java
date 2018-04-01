package com.myproject.elearning.ui.lessondetail;

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
public final class LessonDetailPresenter_Factory<V extends LessonDetailBaseView>
    implements Factory<LessonDetailPresenter<V>> {
  private final MembersInjector<LessonDetailPresenter<V>> lessonDetailPresenterMembersInjector;

  private final Provider<DataManager> dataManagerProvider;

  private final Provider<SchedulerProvider> schedulerProvider;

  private final Provider<CompositeDisposable> compositeDisposableProvider;

  public LessonDetailPresenter_Factory(
      MembersInjector<LessonDetailPresenter<V>> lessonDetailPresenterMembersInjector,
      Provider<DataManager> dataManagerProvider,
      Provider<SchedulerProvider> schedulerProvider,
      Provider<CompositeDisposable> compositeDisposableProvider) {
    assert lessonDetailPresenterMembersInjector != null;
    this.lessonDetailPresenterMembersInjector = lessonDetailPresenterMembersInjector;
    assert dataManagerProvider != null;
    this.dataManagerProvider = dataManagerProvider;
    assert schedulerProvider != null;
    this.schedulerProvider = schedulerProvider;
    assert compositeDisposableProvider != null;
    this.compositeDisposableProvider = compositeDisposableProvider;
  }

  @Override
  public LessonDetailPresenter<V> get() {
    return MembersInjectors.injectMembers(
        lessonDetailPresenterMembersInjector,
        new LessonDetailPresenter<V>(
            dataManagerProvider.get(), schedulerProvider.get(), compositeDisposableProvider.get()));
  }

  public static <V extends LessonDetailBaseView> Factory<LessonDetailPresenter<V>> create(
      MembersInjector<LessonDetailPresenter<V>> lessonDetailPresenterMembersInjector,
      Provider<DataManager> dataManagerProvider,
      Provider<SchedulerProvider> schedulerProvider,
      Provider<CompositeDisposable> compositeDisposableProvider) {
    return new LessonDetailPresenter_Factory<V>(
        lessonDetailPresenterMembersInjector,
        dataManagerProvider,
        schedulerProvider,
        compositeDisposableProvider);
  }
}
