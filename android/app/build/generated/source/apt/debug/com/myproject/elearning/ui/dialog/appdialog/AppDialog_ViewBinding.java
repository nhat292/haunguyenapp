// Generated code from Butter Knife. Do not modify!
package com.myproject.elearning.ui.dialog.appdialog;

import android.support.annotation.CallSuper;
import android.support.annotation.UiThread;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import butterknife.Unbinder;
import butterknife.internal.DebouncingOnClickListener;
import butterknife.internal.Utils;
import com.myproject.elearning.R;
import java.lang.IllegalStateException;
import java.lang.Override;

public class AppDialog_ViewBinding implements Unbinder {
  private AppDialog target;

  private View view2131230765;

  private View view2131230769;

  @UiThread
  public AppDialog_ViewBinding(final AppDialog target, View source) {
    this.target = target;

    View view;
    target.txtTitle = Utils.findRequiredViewAsType(source, R.id.txtTitle, "field 'txtTitle'", TextView.class);
    target.txtMessage = Utils.findRequiredViewAsType(source, R.id.txtMessage, "field 'txtMessage'", TextView.class);
    view = Utils.findRequiredView(source, R.id.btnCancel, "field 'btnCancel' and method 'onCancelClick'");
    target.btnCancel = Utils.castView(view, R.id.btnCancel, "field 'btnCancel'", Button.class);
    view2131230765 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onCancelClick(p0);
      }
    });
    view = Utils.findRequiredView(source, R.id.btnOk, "field 'btnOk' and method 'onOkClick'");
    target.btnOk = Utils.castView(view, R.id.btnOk, "field 'btnOk'", Button.class);
    view2131230769 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onOkClick(p0);
      }
    });
  }

  @Override
  @CallSuper
  public void unbind() {
    AppDialog target = this.target;
    if (target == null) throw new IllegalStateException("Bindings already cleared.");
    this.target = null;

    target.txtTitle = null;
    target.txtMessage = null;
    target.btnCancel = null;
    target.btnOk = null;

    view2131230765.setOnClickListener(null);
    view2131230765 = null;
    view2131230769.setOnClickListener(null);
    view2131230769 = null;
  }
}
