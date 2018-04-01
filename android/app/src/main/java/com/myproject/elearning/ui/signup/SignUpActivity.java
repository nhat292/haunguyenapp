
package com.myproject.elearning.ui.signup;

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

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

import static com.myproject.elearning.utils.KeyboardUtils.showSoftInput;
import static com.myproject.elearning.utils.ScreenUtils.getScreenHeight;
import static com.myproject.elearning.utils.ScreenUtils.getStatusBarHeight;


/**
 * Created by Nhat on 12/13/17.
 */


public class SignUpActivity extends BaseActivity implements SignUpBaseView {

    @Inject
    SignUpMvpPresenter<SignUpBaseView> mPresenter;


    public static Intent getStartIntent(Context context) {
        Intent intent = new Intent(context, SignUpActivity.class);
        return intent;
    }

    @BindView(R.id.llContent)
    LinearLayout llContent;
    @BindView(R.id.txtTitle)
    TextView txtTitle;
    @BindView(R.id.editFirstLastName)
    TextInputEditText editFirstLastName;
    @BindView(R.id.editPhone)
    TextInputEditText editPhone;
    @BindView(R.id.editUsername)
    TextInputEditText editUsername;
    @BindView(R.id.editPassword)
    TextInputEditText editPassword;
    @BindView(R.id.editConfirmPassword)
    TextInputEditText editConfirmPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_up);

        getActivityComponent().inject(this);

        setUnBinder(ButterKnife.bind(this));

        mPresenter.onAttach(SignUpActivity.this);

        setUp();
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
                int screenHeight = getScreenHeight(SignUpActivity.this);
                int contentHeight = llContent.getMeasuredHeight();
                int marginTop = (screenHeight - contentHeight) / 2;
                int minSpacing = getStatusBarHeight(SignUpActivity.this) + 50;
                if (marginTop < minSpacing) {
                    marginTop = minSpacing;
                }
                LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) txtTitle.getLayoutParams();
                params.setMargins(0, marginTop, 0, 0);
                txtTitle.setLayoutParams(params);
            }
        });
    }

    @OnClick(R.id.llFirstLastName)
    public void onFirstLastNameClick() {
        editFirstLastName.requestFocus();
        showSoftInput(editFirstLastName, this);
    }

    @OnClick(R.id.llPhoneNumber)
    public void onPhoneClick() {
        editPhone.requestFocus();
        showSoftInput(editPhone, this);
    }

    @OnClick(R.id.llUsername)
    public void onUsernameClick() {
        editUsername.requestFocus();
        showSoftInput(editUsername, this);
    }

    @OnClick(R.id.llPassword)
    public void onPasswordClick() {
        editPassword.requestFocus();
        showSoftInput(editPassword, this);
    }

    @OnClick(R.id.llConfirmPassword)
    public void onConfirmPasswordClick() {
        editConfirmPassword.requestFocus();
        showSoftInput(editConfirmPassword, this);
    }

    @OnClick(R.id.btnSignUp)
    public void onSignUpClick() {

    }
}
