package com.myproject.elearning.ui.signup;

import dagger.MembersInjector;
import javax.annotation.Generated;
import javax.inject.Provider;

@Generated(
  value = "dagger.internal.codegen.ComponentProcessor",
  comments = "https://google.github.io/dagger"
)
public final class SignUpActivity_MembersInjector implements MembersInjector<SignUpActivity> {
  private final Provider<SignUpMvpPresenter<SignUpBaseView>> mPresenterProvider;

  public SignUpActivity_MembersInjector(
      Provider<SignUpMvpPresenter<SignUpBaseView>> mPresenterProvider) {
    assert mPresenterProvider != null;
    this.mPresenterProvider = mPresenterProvider;
  }

  public static MembersInjector<SignUpActivity> create(
      Provider<SignUpMvpPresenter<SignUpBaseView>> mPresenterProvider) {
    return new SignUpActivity_MembersInjector(mPresenterProvider);
  }

  @Override
  public void injectMembers(SignUpActivity instance) {
    if (instance == null) {
      throw new NullPointerException("Cannot inject members into a null reference");
    }
    instance.mPresenter = mPresenterProvider.get();
  }

  public static void injectMPresenter(
      SignUpActivity instance, Provider<SignUpMvpPresenter<SignUpBaseView>> mPresenterProvider) {
    instance.mPresenter = mPresenterProvider.get();
  }
}
