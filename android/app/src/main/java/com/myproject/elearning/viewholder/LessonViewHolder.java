package com.myproject.elearning.viewholder;

import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.myproject.elearning.R;
import com.myproject.elearning.callback.OnItemClickListener;
import com.myproject.elearning.data.network.model.objects.Lesson;
import com.myproject.elearning.ui.base.BaseViewHolder;

import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

/**
 * Created by Nhat on 1/13/18.
 */

public class LessonViewHolder extends BaseViewHolder {

    @BindView(R.id.llItem)
    LinearLayout llItem;
    @BindView(R.id.imgLesson)
    ImageView imgLesson;
    @BindView(R.id.txtLesson)
    TextView txtLesson;

    public LessonViewHolder(View itemView) {
        super(itemView);
        ButterKnife.bind(this, itemView);
    }

    @Override
    protected void clear() {

    }

    public void bind(List<Lesson> lessons, int pos, OnItemClickListener listener) {
        Lesson lesson = lessons.get(pos);
        txtLesson.setText(lesson.getTitle());
        Glide.with(itemView.getContext())
                .load(lesson.getImage())
                .into(imgLesson);
        llItem.setOnClickListener(view -> listener.onClick(lesson, pos));
    }
}
