
package com.myproject.elearning.ui.splash;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

import com.myproject.elearning.R;
import com.myproject.elearning.ui.base.BaseActivity;
import com.myproject.elearning.ui.login.LoginActivity;

import javax.inject.Inject;

import butterknife.ButterKnife;


/**
 * Created by Nhat on 12/13/17.
 */


public class SplashActivity extends BaseActivity implements SplashBaseView {

    @Inject
    SplashMvpPresenter<SplashBaseView> mPresenter;

    public static Intent getStartIntent(Context context) {
        Intent intent = new Intent(context, SplashActivity.class);
        return intent;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);

        getActivityComponent().inject(this);

        setUnBinder(ButterKnife.bind(this));

        mPresenter.onAttach(SplashActivity.this);
    }


    @Override
    public void openLoginActivity() {
        Intent intent = LoginActivity.getStartIntent(SplashActivity.this);
        startActivity(intent);
        finish();
    }

    @Override
    public void openMainActivity() {

    }

    @Override
    protected void onDestroy() {
        mPresenter.onDetach();
        super.onDestroy();
    }

    @Override
    protected void setUp() {

    }
}
