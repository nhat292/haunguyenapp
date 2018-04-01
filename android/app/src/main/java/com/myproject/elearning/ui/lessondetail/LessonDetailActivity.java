
package com.myproject.elearning.ui.lessondetail;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.myproject.elearning.R;
import com.myproject.elearning.data.network.model.objects.Lesson;
import com.myproject.elearning.ui.base.BaseActivity;

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import cn.jzvd.JZVideoPlayer;
import cn.jzvd.JZVideoPlayerStandard;

import static com.myproject.elearning.utils.ScreenUtils.getStatusBarHeight;


/**
 * Created by Nhat on 12/13/17.
 */


public class LessonDetailActivity extends BaseActivity implements LessonDetailBaseView {

    private static final String EXTRA_LESSON = "LESSON";

    @Inject
    LessonDetailMvpPresenter<LessonDetailBaseView> mPresenter;


    public static Intent getStartIntent(Context context, Lesson lesson) {
        Intent intent = new Intent(context, LessonDetailActivity.class);
        intent.putExtra(EXTRA_LESSON, lesson);
        return intent;
    }

    @BindView(R.id.imgBack)
    ImageView imgBack;
    @BindView(R.id.txtTitle)
    TextView txtTitle;
    @BindView(R.id.vVideo)
    JZVideoPlayerStandard vVideo;

    private Lesson mLesson;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lesson_detail);

        getActivityComponent().inject(this);

        setUnBinder(ButterKnife.bind(this));

        mPresenter.onAttach(LessonDetailActivity.this);

        setUp();
    }


    @Override
    protected void onDestroy() {
        mPresenter.onDetach();
        super.onDestroy();
    }

    @Override
    public void onBackPressed() {
        onBackClick();
    }

    @Override
    protected void setUp() {
        mLesson = getIntent().getParcelableExtra(EXTRA_LESSON);

        RelativeLayout.LayoutParams params = (RelativeLayout.LayoutParams) imgBack.getLayoutParams();
        int statusBarHeight = getStatusBarHeight(this);
        int topMargin = statusBarHeight + (int) getResources().getDimension(R.dimen.margin_padding_small);
        params.setMargins(params.leftMargin, topMargin, params.rightMargin, params.bottomMargin);
        imgBack.setLayoutParams(params);

        txtTitle.setText(mLesson.getTitle());

        vVideo.setUp(getString(R.string.video_url), JZVideoPlayerStandard.SCREEN_WINDOW_NORMAL);

    }

    @OnClick(R.id.imgBack)
    public void onBackClick() {
        if (JZVideoPlayer.backPress()) {
            return;
        }
        super.onBackPressed();
    }

    @Override
    protected void onPause() {
        super.onPause();
        JZVideoPlayer.releaseAllVideos();
    }
}
