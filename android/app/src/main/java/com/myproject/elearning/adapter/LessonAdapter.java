package com.myproject.elearning.adapter;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.myproject.elearning.R;
import com.myproject.elearning.callback.OnItemClickListener;
import com.myproject.elearning.data.network.model.objects.Lesson;
import com.myproject.elearning.viewholder.LessonViewHolder;

import java.util.List;

/**
 * Created by Nhat on 12/15/17.
 */

public class LessonAdapter extends RecyclerView.Adapter<LessonViewHolder> {

    private List<Lesson> lessons;
    private OnItemClickListener listener;

    public LessonAdapter(List<Lesson> lessons, OnItemClickListener listener) {
        this.lessons = lessons;
        this.listener = listener;
    }

    @Override
    public LessonViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.lessons_item, null);
        RecyclerView.LayoutParams layoutParams = new RecyclerView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        view.setLayoutParams(layoutParams);
        return new LessonViewHolder(view);
    }

    @Override
    public void onBindViewHolder(LessonViewHolder holder, int position) {
        holder.bind(lessons, position, listener);
    }

    @Override
    public int getItemCount() {
        return lessons.size();
    }
}
