// Generated code from Butter Knife. Do not modify!
package com.myproject.elearning.ui.lessondetail;

import android.support.annotation.CallSuper;
import android.support.annotation.UiThread;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import butterknife.Unbinder;
import butterknife.internal.DebouncingOnClickListener;
import butterknife.internal.Utils;
import cn.jzvd.JZVideoPlayerStandard;
import com.myproject.elearning.R;
import java.lang.IllegalStateException;
import java.lang.Override;

public class LessonDetailActivity_ViewBinding implements Unbinder {
  private LessonDetailActivity target;

  private View view2131230832;

  @UiThread
  public LessonDetailActivity_ViewBinding(LessonDetailActivity target) {
    this(target, target.getWindow().getDecorView());
  }

  @UiThread
  public LessonDetailActivity_ViewBinding(final LessonDetailActivity target, View source) {
    this.target = target;

    View view;
    view = Utils.findRequiredView(source, R.id.imgBack, "field 'imgBack' and method 'onBackClick'");
    target.imgBack = Utils.castView(view, R.id.imgBack, "field 'imgBack'", ImageView.class);
    view2131230832 = view;
    view.setOnClickListener(new DebouncingOnClickListener() {
      @Override
      public void doClick(View p0) {
        target.onBackClick();
      }
    });
    target.txtTitle = Utils.findRequiredViewAsType(source, R.id.txtTitle, "field 'txtTitle'", TextView.class);
    target.vVideo = Utils.findRequiredViewAsType(source, R.id.vVideo, "field 'vVideo'", JZVideoPlayerStandard.class);
  }

  @Override
  @CallSuper
  public void unbind() {
    LessonDetailActivity target = this.target;
    if (target == null) throw new IllegalStateException("Bindings already cleared.");
    this.target = null;

    target.imgBack = null;
    target.txtTitle = null;
    target.vVideo = null;

    view2131230832.setOnClickListener(null);
    view2131230832 = null;
  }
}
