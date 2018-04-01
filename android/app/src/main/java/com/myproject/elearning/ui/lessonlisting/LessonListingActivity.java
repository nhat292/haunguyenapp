
package com.myproject.elearning.ui.lessonlisting;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.myproject.elearning.R;
import com.myproject.elearning.adapter.LessonAdapter;
import com.myproject.elearning.data.network.model.objects.Lesson;
import com.myproject.elearning.data.network.model.objects.LessonCategory;
import com.myproject.elearning.ui.base.BaseActivity;
import com.myproject.elearning.ui.custom.SpacesItemDecoration;
import com.myproject.elearning.ui.lessondetail.LessonDetailActivity;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

import static com.myproject.elearning.utils.ScreenUtils.getStatusBarHeight;


/**
 * Created by Nhat on 12/13/17.
 */


public class LessonListingActivity extends BaseActivity implements LessonListingBaseView, SwipeRefreshLayout.OnRefreshListener {


    private static final String EXTRA_LESSON_CATEGORY = "LESSON_CATEGORY";

    @Inject
    LessonListingMvpPresenter<LessonListingBaseView> mPresenter;


    public static Intent getStartIntent(Context context, LessonCategory lessonCategory) {
        Intent intent = new Intent(context, LessonListingActivity.class);
        intent.putExtra(EXTRA_LESSON_CATEGORY, lessonCategory);
        return intent;
    }

    @BindView(R.id.imgBack)
    ImageView imgBack;
    @BindView(R.id.txtTitle)
    TextView txtTitle;
    @BindView(R.id.swipeRefreshLessons)
    SwipeRefreshLayout swipeRefreshLessons;
    @BindView(R.id.recyclerLessons)
    RecyclerView recyclerLessons;

    private LessonCategory mLessonCategory;
    private List<Lesson> mLessons = new ArrayList<>();
    private LessonAdapter mLessonAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lesson_listing);

        getActivityComponent().inject(this);

        setUnBinder(ButterKnife.bind(this));

        mPresenter.onAttach(LessonListingActivity.this);

        setUp();
    }


    @Override
    protected void onDestroy() {
        mPresenter.onDetach();
        super.onDestroy();
    }

    @Override
    protected void setUp() {
        mLessonCategory = getIntent().getParcelableExtra(EXTRA_LESSON_CATEGORY);

        txtTitle.setText(mLessonCategory.getTitle());

        swipeRefreshLessons.setColorSchemeResources(R.color.colorPrimary, R.color.colorPrimary);
        swipeRefreshLessons.setOnRefreshListener(this);

        RelativeLayout.LayoutParams params = (RelativeLayout.LayoutParams) imgBack.getLayoutParams();
        int statusBarHeight = getStatusBarHeight(this);
        int topMargin = statusBarHeight + (int) getResources().getDimension(R.dimen.margin_padding_small);
        params.setMargins(params.leftMargin, topMargin, params.rightMargin, params.bottomMargin);
        imgBack.setLayoutParams(params);

        if (getResources().getConfiguration().orientation == Configuration.ORIENTATION_PORTRAIT) {
            recyclerLessons.setLayoutManager(new GridLayoutManager(this, 2));
        } else {
            recyclerLessons.setLayoutManager(new GridLayoutManager(this, 4));
        }

        int spacingInPixels = (int) getResources().getDimension(R.dimen.lesson_item_spacing);
        recyclerLessons.addItemDecoration(new SpacesItemDecoration(spacingInPixels, true));

        mLessons.addAll(Lesson.getDummiesData());
        mLessonAdapter = new LessonAdapter(mLessons, ((object, position) -> startActivity(LessonDetailActivity.getStartIntent(LessonListingActivity.this, (Lesson) object))));
        recyclerLessons.setAdapter(mLessonAdapter);

    }

    @OnClick(R.id.imgBack)
    public void onBackClick() {
        finish();
    }

    @Override
    public void onRefresh() {

    }
}
