package com.myproject.elearning.dagger.module;

import com.myproject.elearning.ui.profile.ProfileBaseView;
import com.myproject.elearning.ui.profile.ProfileMvpPresenter;
import com.myproject.elearning.ui.profile.ProfilePresenter;
import dagger.internal.Factory;
import dagger.internal.Preconditions;
import javax.annotation.Generated;
import javax.inject.Provider;

@Generated(
  value = "dagger.internal.codegen.ComponentProcessor",
  comments = "https://google.github.io/dagger"
)
public final class ActivityModule_ProvideProfilePresenterFactory
    implements Factory<ProfileMvpPresenter<ProfileBaseView>> {
  private final ActivityModule module;

  private final Provider<ProfilePresenter<ProfileBaseView>> presenterProvider;

  public ActivityModule_ProvideProfilePresenterFactory(
      ActivityModule module, Provider<ProfilePresenter<ProfileBaseView>> presenterProvider) {
    assert module != null;
    this.module = module;
    assert presenterProvider != null;
    this.presenterProvider = presenterProvider;
  }

  @Override
  public ProfileMvpPresenter<ProfileBaseView> get() {
    return Preconditions.checkNotNull(
        module.provideProfilePresenter(presenterProvider.get()),
        "Cannot return null from a non-@Nullable @Provides method");
  }

  public static Factory<ProfileMvpPresenter<ProfileBaseView>> create(
      ActivityModule module, Provider<ProfilePresenter<ProfileBaseView>> presenterProvider) {
    return new ActivityModule_ProvideProfilePresenterFactory(module, presenterProvider);
  }

  /** Proxies {@link ActivityModule#provideProfilePresenter(ProfilePresenter)}. */
  public static ProfileMvpPresenter<ProfileBaseView> proxyProvideProfilePresenter(
      ActivityModule instance, ProfilePresenter<ProfileBaseView> presenter) {
    return instance.provideProfilePresenter(presenter);
  }
}
