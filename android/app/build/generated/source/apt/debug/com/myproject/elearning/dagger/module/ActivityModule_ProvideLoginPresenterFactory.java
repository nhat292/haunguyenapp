package com.myproject.elearning.dagger.module;

import com.myproject.elearning.ui.login.LoginBaseView;
import com.myproject.elearning.ui.login.LoginMvpPresenter;
import com.myproject.elearning.ui.login.LoginPresenter;
import dagger.internal.Factory;
import dagger.internal.Preconditions;
import javax.annotation.Generated;
import javax.inject.Provider;

@Generated(
  value = "dagger.internal.codegen.ComponentProcessor",
  comments = "https://google.github.io/dagger"
)
public final class ActivityModule_ProvideLoginPresenterFactory
    implements Factory<LoginMvpPresenter<LoginBaseView>> {
  private final ActivityModule module;

  private final Provider<LoginPresenter<LoginBaseView>> presenterProvider;

  public ActivityModule_ProvideLoginPresenterFactory(
      ActivityModule module, Provider<LoginPresenter<LoginBaseView>> presenterProvider) {
    assert module != null;
    this.module = module;
    assert presenterProvider != null;
    this.presenterProvider = presenterProvider;
  }

  @Override
  public LoginMvpPresenter<LoginBaseView> get() {
    return Preconditions.checkNotNull(
        module.provideLoginPresenter(presenterProvider.get()),
        "Cannot return null from a non-@Nullable @Provides method");
  }

  public static Factory<LoginMvpPresenter<LoginBaseView>> create(
      ActivityModule module, Provider<LoginPresenter<LoginBaseView>> presenterProvider) {
    return new ActivityModule_ProvideLoginPresenterFactory(module, presenterProvider);
  }

  /** Proxies {@link ActivityModule#provideLoginPresenter(LoginPresenter)}. */
  public static LoginMvpPresenter<LoginBaseView> proxyProvideLoginPresenter(
      ActivityModule instance, LoginPresenter<LoginBaseView> presenter) {
    return instance.provideLoginPresenter(presenter);
  }
}
