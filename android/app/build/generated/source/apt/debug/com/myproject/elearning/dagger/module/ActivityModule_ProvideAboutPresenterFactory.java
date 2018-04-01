package com.myproject.elearning.dagger.module;

import com.myproject.elearning.ui.about.AboutBaseView;
import com.myproject.elearning.ui.about.AboutMvpPresenter;
import com.myproject.elearning.ui.about.AboutPresenter;
import dagger.internal.Factory;
import dagger.internal.Preconditions;
import javax.annotation.Generated;
import javax.inject.Provider;

@Generated(
  value = "dagger.internal.codegen.ComponentProcessor",
  comments = "https://google.github.io/dagger"
)
public final class ActivityModule_ProvideAboutPresenterFactory
    implements Factory<AboutMvpPresenter<AboutBaseView>> {
  private final ActivityModule module;

  private final Provider<AboutPresenter<AboutBaseView>> presenterProvider;

  public ActivityModule_ProvideAboutPresenterFactory(
      ActivityModule module, Provider<AboutPresenter<AboutBaseView>> presenterProvider) {
    assert module != null;
    this.module = module;
    assert presenterProvider != null;
    this.presenterProvider = presenterProvider;
  }

  @Override
  public AboutMvpPresenter<AboutBaseView> get() {
    return Preconditions.checkNotNull(
        module.provideAboutPresenter(presenterProvider.get()),
        "Cannot return null from a non-@Nullable @Provides method");
  }

  public static Factory<AboutMvpPresenter<AboutBaseView>> create(
      ActivityModule module, Provider<AboutPresenter<AboutBaseView>> presenterProvider) {
    return new ActivityModule_ProvideAboutPresenterFactory(module, presenterProvider);
  }

  /** Proxies {@link ActivityModule#provideAboutPresenter(AboutPresenter)}. */
  public static AboutMvpPresenter<AboutBaseView> proxyProvideAboutPresenter(
      ActivityModule instance, AboutPresenter<AboutBaseView> presenter) {
    return instance.provideAboutPresenter(presenter);
  }
}
