package com.myproject.elearning.viewholder;

import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.myproject.elearning.R;
import com.myproject.elearning.callback.OnItemClickListener;
import com.myproject.elearning.data.network.model.objects.LessonCategory;
import com.myproject.elearning.ui.base.BaseViewHolder;

import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

/**
 * Created by Nhat on 1/13/18.
 */

public class LessonCategoriesViewHolder extends BaseViewHolder {

    @BindView(R.id.llItem)
    LinearLayout llItem;
    @BindView(R.id.txtTitle)
    TextView txtTitle;
    @BindView(R.id.txtSubTitle)
    TextView txtSubTitle;
    @BindView(R.id.txtCount)
    TextView txtCount;

    public LessonCategoriesViewHolder(View itemView) {
        super(itemView);
        ButterKnife.bind(this, itemView);
    }

    @Override
    protected void clear() {

    }

    public void bind(List<LessonCategory> lessonCategories, int pos, OnItemClickListener listener) {
        LessonCategory lessonCategory = lessonCategories.get(pos);
        txtTitle.setText(lessonCategory.getTitle());
        txtSubTitle.setText(lessonCategory.getSubTitle());
        txtCount.setText(String.valueOf(lessonCategory.getCount()));
        llItem.setOnClickListener(view -> listener.onClick(lessonCategory, pos));
    }
}
