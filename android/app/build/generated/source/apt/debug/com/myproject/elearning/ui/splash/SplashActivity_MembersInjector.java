package com.myproject.elearning.ui.splash;

import dagger.MembersInjector;
import javax.annotation.Generated;
import javax.inject.Provider;

@Generated(
  value = "dagger.internal.codegen.ComponentProcessor",
  comments = "https://google.github.io/dagger"
)
public final class SplashActivity_MembersInjector implements MembersInjector<SplashActivity> {
  private final Provider<SplashMvpPresenter<SplashBaseView>> mPresenterProvider;

  public SplashActivity_MembersInjector(
      Provider<SplashMvpPresenter<SplashBaseView>> mPresenterProvider) {
    assert mPresenterProvider != null;
    this.mPresenterProvider = mPresenterProvider;
  }

  public static MembersInjector<SplashActivity> create(
      Provider<SplashMvpPresenter<SplashBaseView>> mPresenterProvider) {
    return new SplashActivity_MembersInjector(mPresenterProvider);
  }

  @Override
  public void injectMembers(SplashActivity instance) {
    if (instance == null) {
      throw new NullPointerException("Cannot inject members into a null reference");
    }
    instance.mPresenter = mPresenterProvider.get();
  }

  public static void injectMPresenter(
      SplashActivity instance, Provider<SplashMvpPresenter<SplashBaseView>> mPresenterProvider) {
    instance.mPresenter = mPresenterProvider.get();
  }
}
