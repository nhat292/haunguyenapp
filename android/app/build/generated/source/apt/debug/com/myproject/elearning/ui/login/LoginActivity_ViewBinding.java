// Generated code from Butter Knife. Do not modify!
package com.myproject.elearning.ui.login;

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

public class LoginActivity_ViewBinding implements Unbinder {
  private LoginActivity target;

  private View view2131230856;

  private View view2131230854;

  private View view2131230772;

  private View view2131230962;

  @UiThread
  public LoginActivity_ViewBinding(LoginActivity target) {
    this(target, target.getWindow().getDecorView());
  }

  @UiThread
  public LoginActivity_ViewBinding(final LoginActivity target, View source) {
    this.target = target;

    View view;
    target.txtTitle = Utils.findRequiredViewAsType(source, R.id.txtTitle, "field 'txtTitle'", TextView.class);
    target.llContent = Utils.findRequiredViewAsType(source, R.id.llContent, "field 'llContent'", LinearLayout.class);
    target.editUsername = Utils.findRequiredViewAsType(source, R.id.editUsername, "field 'editUsername'", TextInputEditText.class);
    target.editPassword = Utils.findRequiredViewAsType(source, R.id.editPassword, "field 'editPassword'", TextInputEditText.class);
    view = Utils.findRequiredView(source, R.id.llUsername, "method 'onUserClick'");
    view2131230856 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onUserClick();
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
    view = Utils.findRequiredView(source, R.id.btnSignIn, "method 'onSignInClick'");
    view2131230772 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onSignInClick();
      }
    });
    view = Utils.findRequiredView(source, R.id.txtSignUp, "method 'onSignUpClick'");
    view2131230962 = view;
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
    LoginActivity target = this.target;
    if (target == null) throw new IllegalStateException("Bindings already cleared.");
    this.target = null;

    target.txtTitle = null;
    target.llContent = null;
    target.editUsername = null;
    target.editPassword = null;

    view2131230856.setOnClickListener(null);
    view2131230856 = null;
    view2131230854.setOnClickListener(null);
    view2131230854 = null;
    view2131230772.setOnClickListener(null);
    view2131230772 = null;
    view2131230962.setOnClickListener(null);
    view2131230962 = null;
  }
}
