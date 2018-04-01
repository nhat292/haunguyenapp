package com.myproject.elearning.ui.about;

import dagger.MembersInjector;
import javax.annotation.Generated;
import javax.inject.Provider;

@Generated(
  value = "dagger.internal.codegen.ComponentProcessor",
  comments = "https://google.github.io/dagger"
)
public final class AboutFragment_MembersInjector implements MembersInjector<AboutFragment> {
  private final Provider<AboutMvpPresenter<AboutBaseView>> mPresenterProvider;

  public AboutFragment_MembersInjector(
      Provider<AboutMvpPresenter<AboutBaseView>> mPresenterProvider) {
    assert mPresenterProvider != null;
    this.mPresenterProvider = mPresenterProvider;
  }

  public static MembersInjector<AboutFragment> create(
      Provider<AboutMvpPresenter<AboutBaseView>> mPresenterProvider) {
    return new AboutFragment_MembersInjector(mPresenterProvider);
  }

  @Override
  public void injectMembers(AboutFragment instance) {
    if (instance == null) {
      throw new NullPointerException("Cannot inject members into a null reference");
    }
    instance.mPresenter = mPresenterProvider.get();
  }

  public static void injectMPresenter(
      AboutFragment instance, Provider<AboutMvpPresenter<AboutBaseView>> mPresenterProvider) {
    instance.mPresenter = mPresenterProvider.get();
  }
}
