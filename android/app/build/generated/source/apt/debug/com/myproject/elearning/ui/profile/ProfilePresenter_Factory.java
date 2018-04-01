package com.myproject.elearning.ui.profile;

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
public final class ProfilePresenter_Factory<V extends ProfileBaseView>
    implements Factory<ProfilePresenter<V>> {
  private final MembersInjector<ProfilePresenter<V>> profilePresenterMembersInjector;

  private final Provider<DataManager> dataManagerProvider;

  private final Provider<SchedulerProvider> schedulerProvider;

  private final Provider<CompositeDisposable> compositeDisposableProvider;

  public ProfilePresenter_Factory(
      MembersInjector<ProfilePresenter<V>> profilePresenterMembersInjector,
      Provider<DataManager> dataManagerProvider,
      Provider<SchedulerProvider> schedulerProvider,
      Provider<CompositeDisposable> compositeDisposableProvider) {
    assert profilePresenterMembersInjector != null;
    this.profilePresenterMembersInjector = profilePresenterMembersInjector;
    assert dataManagerProvider != null;
    this.dataManagerProvider = dataManagerProvider;
    assert schedulerProvider != null;
    this.schedulerProvider = schedulerProvider;
    assert compositeDisposableProvider != null;
    this.compositeDisposableProvider = compositeDisposableProvider;
  }

  @Override
  public ProfilePresenter<V> get() {
    return MembersInjectors.injectMembers(
        profilePresenterMembersInjector,
        new ProfilePresenter<V>(
            dataManagerProvider.get(), schedulerProvider.get(), compositeDisposableProvider.get()));
  }

  public static <V extends ProfileBaseView> Factory<ProfilePresenter<V>> create(
      MembersInjector<ProfilePresenter<V>> profilePresenterMembersInjector,
      Provider<DataManager> dataManagerProvider,
      Provider<SchedulerProvider> schedulerProvider,
      Provider<CompositeDisposable> compositeDisposableProvider) {
    return new ProfilePresenter_Factory<V>(
        profilePresenterMembersInjector,
        dataManagerProvider,
        schedulerProvider,
        compositeDisposableProvider);
  }
}
