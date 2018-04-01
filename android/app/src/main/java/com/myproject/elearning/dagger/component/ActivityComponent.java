
package com.myproject.elearning.dagger.component;

import com.myproject.elearning.dagger.PerActivity;
import com.myproject.elearning.dagger.module.ActivityModule;
import com.myproject.elearning.ui.about.AboutFragment;
import com.myproject.elearning.ui.lessoncategories.LessonCategoriesFragment;
import com.myproject.elearning.ui.lessondetail.LessonDetailActivity;
import com.myproject.elearning.ui.lessonlisting.LessonListingActivity;
import com.myproject.elearning.ui.login.LoginActivity;
import com.myproject.elearning.ui.profile.ProfileFragment;
import com.myproject.elearning.ui.signup.SignUpActivity;
import com.myproject.elearning.ui.splash.SplashActivity;

import dagger.Component;

/**
 * Created by Nhat on 12/13/17.
 */


@PerActivity
@Component(dependencies = ApplicationComponent.class, modules = ActivityModule.class)
public interface ActivityComponent {

    void inject(SplashActivity activity);

    void inject(LoginActivity activity);

    void inject(SignUpActivity activity);

    void inject(LessonCategoriesFragment fragment);

    void inject(LessonListingActivity activity);

    void inject(LessonDetailActivity activity);

    void inject(ProfileFragment fragment);

    void inject(AboutFragment fragment);

}
