// Generated code from Butter Knife. Do not modify!
package com.myproject.elearning.ui.main;

import android.support.annotation.CallSuper;
import android.support.annotation.UiThread;
import android.support.v4.widget.DrawerLayout;
import android.view.View;
import butterknife.Unbinder;
import butterknife.internal.DebouncingOnClickListener;
import butterknife.internal.Utils;
import com.myproject.elearning.R;
import java.lang.IllegalStateException;
import java.lang.Override;

public class MainActivity_ViewBinding implements Unbinder {
  private MainActivity target;

  private View view2131230767;

  private View view2131230770;

  private View view2131230766;

  private View view2131230763;

  private View view2131230768;

  @UiThread
  public MainActivity_ViewBinding(MainActivity target) {
    this(target, target.getWindow().getDecorView());
  }

  @UiThread
  public MainActivity_ViewBinding(final MainActivity target, View source) {
    this.target = target;

    View view;
    target.drawerLayout = Utils.findRequiredViewAsType(source, R.id.drawerLayout, "field 'drawerLayout'", DrawerLayout.class);
    view = Utils.findRequiredView(source, R.id.btnLessonCategories, "method 'onLessonCategoriesClick'");
    view2131230767 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onLessonCategoriesClick();
      }
    });
    view = Utils.findRequiredView(source, R.id.btnPersonalInformation, "method 'onPersonalInformationClick'");
    view2131230770 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onPersonalInformationClick();
      }
    });
    view = Utils.findRequiredView(source, R.id.btnChangeLanguage, "method 'onChangeLanguageClick'");
    view2131230766 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onChangeLanguageClick();
      }
    });
    view = Utils.findRequiredView(source, R.id.btnAbout, "method 'onAboutClick'");
    view2131230763 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onAboutClick();
      }
    });
    view = Utils.findRequiredView(source, R.id.btnLogout, "method 'onLogoutClick'");
    view2131230768 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onLogoutClick();
      }
    });
  }

  @Override
  @CallSuper
  public void unbind() {
    MainActivity target = this.target;
    if (target == null) throw new IllegalStateException("Bindings already cleared.");
    this.target = null;

    target.drawerLayout = null;

    view2131230767.setOnClickListener(null);
    view2131230767 = null;
    view2131230770.setOnClickListener(null);
    view2131230770 = null;
    view2131230766.setOnClickListener(null);
    view2131230766 = null;
    view2131230763.setOnClickListener(null);
    view2131230763 = null;
    view2131230768.setOnClickListener(null);
    view2131230768 = null;
  }
}
