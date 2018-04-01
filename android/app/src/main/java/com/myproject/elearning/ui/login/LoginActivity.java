
package com.myproject.elearning.ui.login;

import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.support.design.widget.TextInputEditText;
import android.view.ViewTreeObserver;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.myproject.elearning.R;
import com.myproject.elearning.ui.base.BaseActivity;
import com.myproject.elearning.ui.main.MainActivity;
import com.myproject.elearning.ui.signup.SignUpActivity;

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

import static com.myproject.elearning.utils.KeyboardUtils.showSoftInput;
import static com.myproject.elearning.utils.ScreenUtils.getScreenHeight;


/**
 * Created by Nhat on 12/13/17.
 */


public class LoginActivity extends BaseActivity implements LoginBaseView {

    @Inject
    LoginMvpPresenter<LoginBaseView> mPresenter;


    public static Intent getStartIntent(Context context) {
        Intent intent = new Intent(context, LoginActivity.class);
        return intent;
    }

    @BindView(R.id.txtTitle)
    TextView txtTitle;
    @BindView(R.id.llContent)
    LinearLayout llContent;
    @BindView(R.id.editUsername)
    TextInputEditText editUsername;
    @BindView(R.id.editPassword)
    TextInputEditText editPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        getActivityComponent().inject(this);

        setUnBinder(ButterKnife.bind(this));

        mPresenter.onAttach(LoginActivity.this);

        setUp();
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
        ViewTreeObserver vto = llContent.getViewTreeObserver();
        vto.addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
            @Override
            public void onGlobalLayout() {
                if (Build.VERSION.SDK_INT < Build.VERSION_CODES.JELLY_BEAN) {
                    llContent.getViewTreeObserver().removeGlobalOnLayoutListener(this);
                } else {
                    llContent.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                }
                int screenHeight = getScreenHeight(LoginActivity.this);
                int contentHeight = llContent.getMeasuredHeight();
                int marginTop = (screenHeight - contentHeight) / 2;
                LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) txtTitle.getLayoutParams();
                params.setMargins(0, marginTop, 0, 0);
                txtTitle.setLayoutParams(params);
            }
        });

    }

    @OnClick(R.id.llUsername)
    public void onUserClick() {
        editUsername.requestFocus();
        showSoftInput(editUsername, this);
    }

    @OnClick(R.id.llPassword)
    public void onPasswordClick() {
        editPassword.requestFocus();
        showSoftInput(editPassword, this);
    }

    @OnClick(R.id.btnSignIn)
    public void onSignInClick() {
        startActivity(MainActivity.getStartIntent(this));
    }

    @OnClick(R.id.txtSignUp)
    public void onSignUpClick() {
        startActivity(SignUpActivity.getStartIntent(this));
    }
}
