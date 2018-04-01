// Generated code from Butter Knife. Do not modify!
package com.myproject.elearning.ui.lessonlisting;

import android.support.annotation.CallSuper;
import android.support.annotation.UiThread;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import butterknife.Unbinder;
import butterknife.internal.DebouncingOnClickListener;
import butterknife.internal.Utils;
import com.myproject.elearning.R;
import java.lang.IllegalStateException;
import java.lang.Override;

public class LessonListingActivity_ViewBinding implements Unbinder {
  private LessonListingActivity target;

  private View view2131230832;

  @UiThread
  public LessonListingActivity_ViewBinding(LessonListingActivity target) {
    this(target, target.getWindow().getDecorView());
  }

  @UiThread
  public LessonListingActivity_ViewBinding(final LessonListingActivity target, View source) {
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
    target.swipeRefreshLessons = Utils.findRequiredViewAsType(source, R.id.swipeRefreshLessons, "field 'swipeRefreshLessons'", SwipeRefreshLayout.class);
    target.recyclerLessons = Utils.findRequiredViewAsType(source, R.id.recyclerLessons, "field 'recyclerLessons'", RecyclerView.class);
  }

  @Override
  @CallSuper
  public void unbind() {
    LessonListingActivity target = this.target;
    if (target == null) throw new IllegalStateException("Bindings already cleared.");
    this.target = null;

    target.imgBack = null;
    target.txtTitle = null;
    target.swipeRefreshLessons = null;
    target.recyclerLessons = null;

    view2131230832.setOnClickListener(null);
    view2131230832 = null;
  }
}
