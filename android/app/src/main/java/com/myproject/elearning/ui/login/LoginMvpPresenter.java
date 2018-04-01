
package com.myproject.elearning.ui.login;


import com.myproject.elearning.dagger.PerActivity;
import com.myproject.elearning.ui.base.MvpPresenter;

/**
 * Created by Nhat on 12/13/17.
 */


@PerActivity
public interface LoginMvpPresenter<V extends LoginBaseView> extends MvpPresenter<V> {

    void onServerLoginClick(String email, String password);

    void onGoogleLoginClick();

    void onFacebookLoginClick();

}
