
package com.myproject.elearning.ui.lessoncategories;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.myproject.elearning.adapter.LessonCategoriesAdapter;
import com.myproject.elearning.dagger.component.ActivityComponent;
import com.myproject.elearning.data.network.model.objects.LessonCategory;
import com.myproject.elearning.R;
import com.myproject.elearning.ui.base.BaseFragment;
import com.myproject.elearning.ui.lessonlisting.LessonListingActivity;
import com.myproject.elearning.ui.main.MainActivity;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;


/**
 * Created by Nhat on 12/13/17.
 */


public class LessonCategoriesFragment extends BaseFragment implements LessonCategoriesBaseView, SwipeRefreshLayout.OnRefreshListener {

    public static final String TAG = "LessonCategoriesFragment";

    @Inject
    LessonCategoriesMvpPresenter<LessonCategoriesBaseView> mPresenter;

    public static LessonCategoriesFragment newInstance() {
        Bundle args = new Bundle();
        LessonCategoriesFragment fragment = new LessonCategoriesFragment();
        fragment.setArguments(args);
        return fragment;
    }

    @BindView(R.id.recyclerCategories)
    RecyclerView recyclerCategories;
    @BindView(R.id.swipeRefreshCategories)
    SwipeRefreshLayout swipeRefreshCategories;

    private LessonCategoriesAdapter mLessonCategoriesAdapter;
    private List<LessonCategory> mLessonCategories = new ArrayList<>();

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container,
                             @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_lesson_categories, container, false);

        ActivityComponent component = getActivityComponent();
        if (component != null) {
            component.inject(this);
            setUnBinder(ButterKnife.bind(this, view));
            mPresenter.onAttach(this);
        }

        return view;
    }

    @Override
    protected void setUp(View view) {
        swipeRefreshCategories.setColorSchemeResources(R.color.colorPrimary, R.color.colorPrimary);
        swipeRefreshCategories.setOnRefreshListener(this);

        mLessonCategories.addAll(LessonCategory.getDummiesData());
        mLessonCategoriesAdapter = new LessonCategoriesAdapter(mLessonCategories, ((object, position) -> startActivity(LessonListingActivity.getStartIntent(getActivity(), (LessonCategory) object))));
        recyclerCategories.setAdapter(mLessonCategoriesAdapter);
    }

    @Override
    public void onDestroyView() {
        mPresenter.onDetach();
        super.onDestroyView();
    }


    @Override
    public void onRefresh() {

    }

    @OnClick(R.id.imgMenu)
    public void onMenuClick() {
        ((MainActivity) getActivity()).openMenu();
    }
}
