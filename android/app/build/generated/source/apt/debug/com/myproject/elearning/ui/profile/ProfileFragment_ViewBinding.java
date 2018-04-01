// Generated code from Butter Knife. Do not modify!
package com.myproject.elearning.ui.profile;

import android.support.annotation.CallSuper;
import android.support.annotation.UiThread;
import android.support.design.widget.TextInputEditText;
import android.view.View;
import butterknife.Unbinder;
import butterknife.internal.DebouncingOnClickListener;
import butterknife.internal.Utils;
import com.myproject.elearning.R;
import java.lang.IllegalStateException;
import java.lang.Override;

public class ProfileFragment_ViewBinding implements Unbinder {
  private ProfileFragment target;

  private View view2131230855;

  private View view2131230849;

  private View view2131230764;

  private View view2131230771;

  private View view2131230835;

  @UiThread
  public ProfileFragment_ViewBinding(final ProfileFragment target, View source) {
    this.target = target;

    View view;
    target.editPhone = Utils.findRequiredViewAsType(source, R.id.editPhone, "field 'editPhone'", TextInputEditText.class);
    target.editAddress = Utils.findRequiredViewAsType(source, R.id.editAddress, "field 'editAddress'", TextInputEditText.class);
    target.editVipDue = Utils.findRequiredViewAsType(source, R.id.editVipDue, "field 'editVipDue'", TextInputEditText.class);
    view = Utils.findRequiredView(source, R.id.llPhoneNumber, "method 'onPhoneClick'");
    view2131230855 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onPhoneClick();
      }
    });
    view = Utils.findRequiredView(source, R.id.llAddress, "method 'onAddressClick'");
    view2131230849 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onAddressClick();
      }
    });
    view = Utils.findRequiredView(source, R.id.btnBuyVip, "method 'onBuyVipClick'");
    view2131230764 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onBuyVipClick();
      }
    });
    view = Utils.findRequiredView(source, R.id.btnSave, "method 'onSaveClick'");
    view2131230771 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onSaveClick();
      }
    });
    view = Utils.findRequiredView(source, R.id.imgMenu, "method 'onMenuClick'");
    view2131230835 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onMenuClick();
      }
    });
  }

  @Override
  @CallSuper
  public void unbind() {
    ProfileFragment target = this.target;
    if (target == null) throw new IllegalStateException("Bindings already cleared.");
    this.target = null;

    target.editPhone = null;
    target.editAddress = null;
    target.editVipDue = null;

    view2131230855.setOnClickListener(null);
    view2131230855 = null;
    view2131230849.setOnClickListener(null);
    view2131230849 = null;
    view2131230764.setOnClickListener(null);
    view2131230764 = null;
    view2131230771.setOnClickListener(null);
    view2131230771 = null;
    view2131230835.setOnClickListener(null);
    view2131230835 = null;
  }
}
