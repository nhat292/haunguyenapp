package com.myproject.elearning.ui.lessonlisting;

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
public final class LessonListingPresenter_Factory<V extends LessonListingBaseView>
    implements Factory<LessonListingPresenter<V>> {
  private final MembersInjector<LessonListingPresenter<V>> lessonListingPresenterMembersInjector;

  private final Provider<DataManager> dataManagerProvider;

  private final Provider<SchedulerProvider> schedulerProvider;

  private final Provider<CompositeDisposable> compositeDisposableProvider;

  public LessonListingPresenter_Factory(
      MembersInjector<LessonListingPresenter<V>> lessonListingPresenterMembersInjector,
      Provider<DataManager> dataManagerProvider,
      Provider<SchedulerProvider> schedulerProvider,
      Provider<CompositeDisposable> compositeDisposableProvider) {
    assert lessonListingPresenterMembersInjector != null;
    this.lessonListingPresenterMembersInjector = lessonListingPresenterMembersInjector;
    assert dataManagerProvider != null;
    this.dataManagerProvider = dataManagerProvider;
    assert schedulerProvider != null;
    this.schedulerProvider = schedulerProvider;
    assert compositeDisposableProvider != null;
    this.compositeDisposableProvider = compositeDisposableProvider;
  }

  @Override
  public LessonListingPresenter<V> get() {
    return MembersInjectors.injectMembers(
        lessonListingPresenterMembersInjector,
        new LessonListingPresenter<V>(
            dataManagerProvider.get(), schedulerProvider.get(), compositeDisposableProvider.get()));
  }

  public static <V extends LessonListingBaseView> Factory<LessonListingPresenter<V>> create(
      MembersInjector<LessonListingPresenter<V>> lessonListingPresenterMembersInjector,
      Provider<DataManager> dataManagerProvider,
      Provider<SchedulerProvider> schedulerProvider,
      Provider<CompositeDisposable> compositeDisposableProvider) {
    return new LessonListingPresenter_Factory<V>(
        lessonListingPresenterMembersInjector,
        dataManagerProvider,
        schedulerProvider,
        compositeDisposableProvider);
  }
}
