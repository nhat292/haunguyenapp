
package com.myproject.elearning.dagger.module;

import android.content.Context;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;

import com.myproject.elearning.dagger.ActivityContext;
import com.myproject.elearning.dagger.PerActivity;
import com.myproject.elearning.ui.about.AboutBaseView;
import com.myproject.elearning.ui.about.AboutMvpPresenter;
import com.myproject.elearning.ui.about.AboutPresenter;
import com.myproject.elearning.ui.lessoncategories.LessonCategoriesBaseView;
import com.myproject.elearning.ui.lessoncategories.LessonCategoriesMvpPresenter;
import com.myproject.elearning.ui.lessoncategories.LessonCategoriesPresenter;
import com.myproject.elearning.ui.lessondetail.LessonDetailBaseView;
import com.myproject.elearning.ui.lessondetail.LessonDetailMvpPresenter;
import com.myproject.elearning.ui.lessondetail.LessonDetailPresenter;
import com.myproject.elearning.ui.lessonlisting.LessonListingBaseView;
import com.myproject.elearning.ui.lessonlisting.LessonListingMvpPresenter;
import com.myproject.elearning.ui.lessonlisting.LessonListingPresenter;
import com.myproject.elearning.ui.login.LoginBaseView;
import com.myproject.elearning.ui.login.LoginMvpPresenter;
import com.myproject.elearning.ui.login.LoginPresenter;
import com.myproject.elearning.ui.profile.ProfileBaseView;
import com.myproject.elearning.ui.profile.ProfileMvpPresenter;
import com.myproject.elearning.ui.profile.ProfilePresenter;
import com.myproject.elearning.ui.signup.SignUpBaseView;
import com.myproject.elearning.ui.signup.SignUpMvpPresenter;
import com.myproject.elearning.ui.signup.SignUpPresenter;
import com.myproject.elearning.ui.splash.SplashBaseView;
import com.myproject.elearning.ui.splash.SplashMvpPresenter;
import com.myproject.elearning.ui.splash.SplashPresenter;
import com.myproject.elearning.utils.rx.AppSchedulerProvider;
import com.myproject.elearning.utils.rx.SchedulerProvider;

import dagger.Module;
import dagger.Provides;
import io.reactivex.disposables.CompositeDisposable;

/**
 * Created by Nhat on 12/13/17.
 */


@Module
public class ActivityModule {

    private AppCompatActivity mActivity;

    public ActivityModule(AppCompatActivity activity) {
        this.mActivity = activity;
    }

    @Provides
    @ActivityContext
    Context provideContext() {
        return mActivity;
    }

    @Provides
    AppCompatActivity provideActivity() {
        return mActivity;
    }

    @Provides
    CompositeDisposable provideCompositeDisposable() {
        return new CompositeDisposable();
    }

    @Provides
    SchedulerProvider provideSchedulerProvider() {
        return new AppSchedulerProvider();
    }

    @Provides
    @PerActivity
    SplashMvpPresenter<SplashBaseView> provideSplashPresenter(
            SplashPresenter<SplashBaseView> presenter) {
        return presenter;
    }

    @Provides
    @PerActivity
    LoginMvpPresenter<LoginBaseView> provideLoginPresenter(
            LoginPresenter<LoginBaseView> presenter) {
        return presenter;
    }

    @Provides
    @PerActivity
    SignUpMvpPresenter<SignUpBaseView> provideSignUpPresenter(
            SignUpPresenter<SignUpBaseView> presenter) {
        return presenter;
    }

    @Provides
    LessonCategoriesMvpPresenter<LessonCategoriesBaseView> provideLessonCategoriesPresenter(
            LessonCategoriesPresenter<LessonCategoriesBaseView> presenter) {
        return presenter;
    }

    @Provides
    ProfileMvpPresenter<ProfileBaseView> provideProfilePresenter(
            ProfilePresenter<ProfileBaseView> presenter) {
        return presenter;
    }


    @Provides
    AboutMvpPresenter<AboutBaseView> provideAboutPresenter(
            AboutPresenter<AboutBaseView> presenter) {
        return presenter;
    }

    @Provides
    LessonListingMvpPresenter<LessonListingBaseView> provideLessonListingPresenter(
            LessonListingPresenter<LessonListingBaseView> presenter) {
        return presenter;
    }

    @Provides
    LessonDetailMvpPresenter<LessonDetailBaseView> provideLessonDetailPresenter(
            LessonDetailPresenter<LessonDetailBaseView> presenter) {
        return presenter;
    }


    @Provides
    LinearLayoutManager provideLinearLayoutManager(AppCompatActivity activity) {
        return new LinearLayoutManager(activity);
    }
}
