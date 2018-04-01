// Generated code from Butter Knife. Do not modify!
package com.myproject.elearning.ui.dialog.language;

import android.support.annotation.CallSuper;
import android.support.annotation.UiThread;
import android.view.View;
import android.widget.RadioButton;
import butterknife.Unbinder;
import butterknife.internal.DebouncingOnClickListener;
import butterknife.internal.Utils;
import com.myproject.elearning.R;
import java.lang.IllegalStateException;
import java.lang.Override;

public class LanguageDialog_ViewBinding implements Unbinder {
  private LanguageDialog target;

  private View view2131230882;

  private View view2131230881;

  @UiThread
  public LanguageDialog_ViewBinding(final LanguageDialog target, View source) {
    this.target = target;

    View view;
    view = Utils.findRequiredView(source, R.id.radioVietnamese, "field 'radioVietnamese' and method 'onVietnameseClick'");
    target.radioVietnamese = Utils.castView(view, R.id.radioVietnamese, "field 'radioVietnamese'", RadioButton.class);
    view2131230882 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onVietnameseClick();
      }
    });
    view = Utils.findRequiredView(source, R.id.radioEnglish, "field 'radioEnglish' and method 'onEnglishClick'");
    target.radioEnglish = Utils.castView(view, R.id.radioEnglish, "field 'radioEnglish'", RadioButton.class);
    view2131230881 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onEnglishClick();
      }
    });
  }

  @Override
  @CallSuper
  public void unbind() {
    LanguageDialog target = this.target;
    if (target == null) throw new IllegalStateException("Bindings already cleared.");
    this.target = null;

    target.radioVietnamese = null;
    target.radioEnglish = null;

    view2131230882.setOnClickListener(null);
    view2131230882 = null;
    view2131230881.setOnClickListener(null);
    view2131230881 = null;
  }
}
