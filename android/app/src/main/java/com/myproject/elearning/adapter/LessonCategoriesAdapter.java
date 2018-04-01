package com.myproject.elearning.adapter;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.myproject.elearning.R;
import com.myproject.elearning.callback.OnItemClickListener;
import com.myproject.elearning.data.network.model.objects.LessonCategory;
import com.myproject.elearning.viewholder.LessonCategoriesViewHolder;

import java.util.List;

/**
 * Created by Nhat on 12/15/17.
 */

public class LessonCategoriesAdapter extends RecyclerView.Adapter<LessonCategoriesViewHolder> {

    private List<LessonCategory> lessonCategories;
    private OnItemClickListener listener;

    public LessonCategoriesAdapter(List<LessonCategory> lessonCategories, OnItemClickListener listener) {
        this.lessonCategories = lessonCategories;
        this.listener = listener;
    }

    @Override
    public LessonCategoriesViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.lesson_categories_item, null);
        RecyclerView.LayoutParams layoutParams = new RecyclerView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        view.setLayoutParams(layoutParams);
        return new LessonCategoriesViewHolder(view);
    }

    @Override
    public void onBindViewHolder(LessonCategoriesViewHolder holder, int position) {
        holder.bind(lessonCategories, position, listener);
    }

    @Override
    public int getItemCount() {
        return lessonCategories.size();
    }
}
