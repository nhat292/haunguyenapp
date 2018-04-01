// Generated code from Butter Knife. Do not modify!
package com.myproject.elearning.viewholder;

import android.support.annotation.CallSuper;
import android.support.annotation.UiThread;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import butterknife.Unbinder;
import butterknife.internal.Utils;
import com.myproject.elearning.R;
import java.lang.IllegalStateException;
import java.lang.Override;

public class LessonCategoriesViewHolder_ViewBinding implements Unbinder {
  private LessonCategoriesViewHolder target;

  @UiThread
  public LessonCategoriesViewHolder_ViewBinding(LessonCategoriesViewHolder target, View source) {
    this.target = target;

    target.llItem = Utils.findRequiredViewAsType(source, R.id.llItem, "field 'llItem'", LinearLayout.class);
    target.txtTitle = Utils.findRequiredViewAsType(source, R.id.txtTitle, "field 'txtTitle'", TextView.class);
    target.txtSubTitle = Utils.findRequiredViewAsType(source, R.id.txtSubTitle, "field 'txtSubTitle'", TextView.class);
    target.txtCount = Utils.findRequiredViewAsType(source, R.id.txtCount, "field 'txtCount'", TextView.class);
  }

  @Override
  @CallSuper
  public void unbind() {
    LessonCategoriesViewHolder target = this.target;
    if (target == null) throw new IllegalStateException("Bindings already cleared.");
    this.target = null;

    target.llItem = null;
    target.txtTitle = null;
    target.txtSubTitle = null;
    target.txtCount = null;
  }
}
