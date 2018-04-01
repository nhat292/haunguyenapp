package com.myproject.elearning.dagger.module;

import com.myproject.elearning.ui.splash.SplashBaseView;
import com.myproject.elearning.ui.splash.SplashMvpPresenter;
import com.myproject.elearning.ui.splash.SplashPresenter;
import dagger.internal.Factory;
import dagger.internal.Preconditions;
import javax.annotation.Generated;
import javax.inject.Provider;

@Generated(
  value = "dagger.internal.codegen.ComponentProcessor",
  comments = "https://google.github.io/dagger"
)
public final class ActivityModule_ProvideSplashPresenterFactory
    implements Factory<SplashMvpPresenter<SplashBaseView>> {
  private final ActivityModule module;

  private final Provider<SplashPresenter<SplashBaseView>> presenterProvider;

  public ActivityModule_ProvideSplashPresenterFactory(
      ActivityModule module, Provider<SplashPresenter<SplashBaseView>> presenterProvider) {
    assert module != null;
    this.module = module;
    assert presenterProvider != null;
    this.presenterProvider = presenterProvider;
  }

  @Override
  public SplashMvpPresenter<SplashBaseView> get() {
    return Preconditions.checkNotNull(
        module.provideSplashPresenter(presenterProvider.get()),
        "Cannot return null from a non-@Nullable @Provides method");
  }

  public static Factory<SplashMvpPresenter<SplashBaseView>> create(
      ActivityModule module, Provider<SplashPresenter<SplashBaseView>> presenterProvider) {
    return new ActivityModule_ProvideSplashPresenterFactory(module, presenterProvider);
  }

  /** Proxies {@link ActivityModule#provideSplashPresenter(SplashPresenter)}. */
  public static SplashMvpPresenter<SplashBaseView> proxyProvideSplashPresenter(
      ActivityModule instance, SplashPresenter<SplashBaseView> presenter) {
    return instance.provideSplashPresenter(presenter);
  }
}
