package com.myproject.elearning.dagger.module;

import com.myproject.elearning.ui.signup.SignUpBaseView;
import com.myproject.elearning.ui.signup.SignUpMvpPresenter;
import com.myproject.elearning.ui.signup.SignUpPresenter;
import dagger.internal.Factory;
import dagger.internal.Preconditions;
import javax.annotation.Generated;
import javax.inject.Provider;

@Generated(
  value = "dagger.internal.codegen.ComponentProcessor",
  comments = "https://google.github.io/dagger"
)
public final class ActivityModule_ProvideSignUpPresenterFactory
    implements Factory<SignUpMvpPresenter<SignUpBaseView>> {
  private final ActivityModule module;

  private final Provider<SignUpPresenter<SignUpBaseView>> presenterProvider;

  public ActivityModule_ProvideSignUpPresenterFactory(
      ActivityModule module, Provider<SignUpPresenter<SignUpBaseView>> presenterProvider) {
    assert module != null;
    this.module = module;
    assert presenterProvider != null;
    this.presenterProvider = presenterProvider;
  }

  @Override
  public SignUpMvpPresenter<SignUpBaseView> get() {
    return Preconditions.checkNotNull(
        module.provideSignUpPresenter(presenterProvider.get()),
        "Cannot return null from a non-@Nullable @Provides method");
  }

  public static Factory<SignUpMvpPresenter<SignUpBaseView>> create(
      ActivityModule module, Provider<SignUpPresenter<SignUpBaseView>> presenterProvider) {
    return new ActivityModule_ProvideSignUpPresenterFactory(module, presenterProvider);
  }

  /** Proxies {@link ActivityModule#provideSignUpPresenter(SignUpPresenter)}. */
  public static SignUpMvpPresenter<SignUpBaseView> proxyProvideSignUpPresenter(
      ActivityModule instance, SignUpPresenter<SignUpBaseView> presenter) {
    return instance.provideSignUpPresenter(presenter);
  }
}
