// Generated code from Butter Knife. Do not modify!
package com.myproject.elearning.viewholder;

import android.support.annotation.CallSuper;
import android.support.annotation.UiThread;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import butterknife.Unbinder;
import butterknife.internal.Utils;
import com.myproject.elearning.R;
import java.lang.IllegalStateException;
import java.lang.Override;

public class LessonViewHolder_ViewBinding implements Unbinder {
  private LessonViewHolder target;

  @UiThread
  public LessonViewHolder_ViewBinding(LessonViewHolder target, View source) {
    this.target = target;

    target.llItem = Utils.findRequiredViewAsType(source, R.id.llItem, "field 'llItem'", LinearLayout.class);
    target.imgLesson = Utils.findRequiredViewAsType(source, R.id.imgLesson, "field 'imgLesson'", ImageView.class);
    target.txtLesson = Utils.findRequiredViewAsType(source, R.id.txtLesson, "field 'txtLesson'", TextView.class);
  }

  @Override
  @CallSuper
  public void unbind() {
    LessonViewHolder target = this.target;
    if (target == null) throw new IllegalStateException("Bindings already cleared.");
    this.target = null;

    target.llItem = null;
    target.imgLesson = null;
    target.txtLesson = null;
  }
}
