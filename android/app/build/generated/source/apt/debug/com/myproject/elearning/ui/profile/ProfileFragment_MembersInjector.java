package com.myproject.elearning.ui.profile;

import dagger.MembersInjector;
import javax.annotation.Generated;
import javax.inject.Provider;

@Generated(
  value = "dagger.internal.codegen.ComponentProcessor",
  comments = "https://google.github.io/dagger"
)
public final class ProfileFragment_MembersInjector implements MembersInjector<ProfileFragment> {
  private final Provider<ProfileMvpPresenter<ProfileBaseView>> mPresenterProvider;

  public ProfileFragment_MembersInjector(
      Provider<ProfileMvpPresenter<ProfileBaseView>> mPresenterProvider) {
    assert mPresenterProvider != null;
    this.mPresenterProvider = mPresenterProvider;
  }

  public static MembersInjector<ProfileFragment> create(
      Provider<ProfileMvpPresenter<ProfileBaseView>> mPresenterProvider) {
    return new ProfileFragment_MembersInjector(mPresenterProvider);
  }

  @Override
  public void injectMembers(ProfileFragment instance) {
    if (instance == null) {
      throw new NullPointerException("Cannot inject members into a null reference");
    }
    instance.mPresenter = mPresenterProvider.get();
  }

  public static void injectMPresenter(
      ProfileFragment instance, Provider<ProfileMvpPresenter<ProfileBaseView>> mPresenterProvider) {
    instance.mPresenter = mPresenterProvider.get();
  }
}
