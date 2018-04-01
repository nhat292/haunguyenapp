// Generated code from Butter Knife. Do not modify!
package com.myproject.elearning.ui.signup;

import android.support.annotation.CallSuper;
import android.support.annotation.UiThread;
import android.support.design.widget.TextInputEditText;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import butterknife.Unbinder;
import butterknife.internal.DebouncingOnClickListener;
import butterknife.internal.Utils;
import com.myproject.elearning.R;
import java.lang.IllegalStateException;
import java.lang.Override;

public class SignUpActivity_ViewBinding implements Unbinder {
  private SignUpActivity target;

  private View view2131230852;

  private View view2131230855;

  private View view2131230856;

  private View view2131230854;

  private View view2131230850;

  private View view2131230773;

  @UiThread
  public SignUpActivity_ViewBinding(SignUpActivity target) {
    this(target, target.getWindow().getDecorView());
  }

  @UiThread
  public SignUpActivity_ViewBinding(final SignUpActivity target, View source) {
    this.target = target;

    View view;
    target.llContent = Utils.findRequiredViewAsType(source, R.id.llContent, "field 'llContent'", LinearLayout.class);
    target.txtTitle = Utils.findRequiredViewAsType(source, R.id.txtTitle, "field 'txtTitle'", TextView.class);
    target.editFirstLastName = Utils.findRequiredViewAsType(source, R.id.editFirstLastName, "field 'editFirstLastName'", TextInputEditText.class);
    target.editPhone = Utils.findRequiredViewAsType(source, R.id.editPhone, "field 'editPhone'", TextInputEditText.class);
    target.editUsername = Utils.findRequiredViewAsType(source, R.id.editUsername, "field 'editUsername'", TextInputEditText.class);
    target.editPassword = Utils.findRequiredViewAsType(source, R.id.editPassword, "field 'editPassword'", TextInputEditText.class);
    target.editConfirmPassword = Utils.findRequiredViewAsType(source, R.id.editConfirmPassword, "field 'editConfirmPassword'", TextInputEditText.class);
    view = Utils.findRequiredView(source, R.id.llFirstLastName, "method 'onFirstLastNameClick'");
    view2131230852 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onFirstLastNameClick();
      }
    });
    view = Utils.findRequiredView(source, R.id.llPhoneNumber, "method 'onPhoneClick'");
    view2131230855 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onPhoneClick();
      }
    });
    view = Utils.findRequiredView(source, R.id.llUsername, "method 'onUsernameClick'");
    view2131230856 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onUsernameClick();
      }
    });
    view = Utils.findRequiredView(source, R.id.llPassword, "method 'onPasswordClick'");
    view2131230854 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onPasswordClick();
      }
    });
    view = Utils.findRequiredView(source, R.id.llConfirmPassword, "method 'onConfirmPasswordClick'");
    view2131230850 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onConfirmPasswordClick();
      }
    });
    view = Utils.findRequiredView(source, R.id.btnSignUp, "method 'onSignUpClick'");
    view2131230773 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onSignUpClick();
      }
    });
  }

  @Override
  @CallSuper
  public void unbind() {
    SignUpActivity target = this.target;
    if (target == null) throw new IllegalStateException("Bindings already cleared.");
    this.target = null;

    target.llContent = null;
    target.txtTitle = null;
    target.editFirstLastName = null;
    target.editPhone = null;
    target.editUsername = null;
    target.editPassword = null;
    target.editConfirmPassword = null;

    view2131230852.setOnClickListener(null);
    view2131230852 = null;
    view2131230855.setOnClickListener(null);
    view2131230855 = null;
    view2131230856.setOnClickListener(null);
    view2131230856 = null;
    view2131230854.setOnClickListener(null);
    view2131230854 = null;
    view2131230850.setOnClickListener(null);
    view2131230850 = null;
    view2131230773.setOnClickListener(null);
    view2131230773 = null;
  }
}
