package com.myproject.elearning.ui.signup;

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
public final class SignUpPresenter_Factory<V extends SignUpBaseView>
    implements Factory<SignUpPresenter<V>> {
  private final MembersInjector<SignUpPresenter<V>> signUpPresenterMembersInjector;

  private final Provider<DataManager> dataManagerProvider;

  private final Provider<SchedulerProvider> schedulerProvider;

  private final Provider<CompositeDisposable> compositeDisposableProvider;

  public SignUpPresenter_Factory(
      MembersInjector<SignUpPresenter<V>> signUpPresenterMembersInjector,
      Provider<DataManager> dataManagerProvider,
      Provider<SchedulerProvider> schedulerProvider,
      Provider<CompositeDisposable> compositeDisposableProvider) {
    assert signUpPresenterMembersInjector != null;
    this.signUpPresenterMembersInjector = signUpPresenterMembersInjector;
    assert dataManagerProvider != null;
    this.dataManagerProvider = dataManagerProvider;
    assert schedulerProvider != null;
    this.schedulerProvider = schedulerProvider;
    assert compositeDisposableProvider != null;
    this.compositeDisposableProvider = compositeDisposableProvider;
  }

  @Override
  public SignUpPresenter<V> get() {
    return MembersInjectors.injectMembers(
        signUpPresenterMembersInjector,
        new SignUpPresenter<V>(
            dataManagerProvider.get(), schedulerProvider.get(), compositeDisposableProvider.get()));
  }

  public static <V extends SignUpBaseView> Factory<SignUpPresenter<V>> create(
      MembersInjector<SignUpPresenter<V>> signUpPresenterMembersInjector,
      Provider<DataManager> dataManagerProvider,
      Provider<SchedulerProvider> schedulerProvider,
      Provider<CompositeDisposable> compositeDisposableProvider) {
    return new SignUpPresenter_Factory<V>(
        signUpPresenterMembersInjector,
        dataManagerProvider,
        schedulerProvider,
        compositeDisposableProvider);
  }
}
