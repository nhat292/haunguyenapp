// Generated code from Butter Knife. Do not modify!
package com.myproject.elearning.ui.lessoncategories;

import android.support.annotation.CallSuper;
import android.support.annotation.UiThread;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import butterknife.Unbinder;
import butterknife.internal.DebouncingOnClickListener;
import butterknife.internal.Utils;
import com.myproject.elearning.R;
import java.lang.IllegalStateException;
import java.lang.Override;

public class LessonCategoriesFragment_ViewBinding implements Unbinder {
  private LessonCategoriesFragment target;

  private View view2131230835;

  @UiThread
  public LessonCategoriesFragment_ViewBinding(final LessonCategoriesFragment target, View source) {
    this.target = target;

    View view;
    target.recyclerCategories = Utils.findRequiredViewAsType(source, R.id.recyclerCategories, "field 'recyclerCategories'", RecyclerView.class);
    target.swipeRefreshCategories = Utils.findRequiredViewAsType(source, R.id.swipeRefreshCategories, "field 'swipeRefreshCategories'", SwipeRefreshLayout.class);
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
    LessonCategoriesFragment target = this.target;
    if (target == null) throw new IllegalStateException("Bindings already cleared.");
    this.target = null;

    target.recyclerCategories = null;
    target.swipeRefreshCategories = null;

    view2131230835.setOnClickListener(null);
    view2131230835 = null;
  }
}
