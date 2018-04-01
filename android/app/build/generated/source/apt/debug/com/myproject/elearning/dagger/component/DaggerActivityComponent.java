package com.myproject.elearning.dagger.component;

import com.myproject.elearning.dagger.module.ActivityModule;
import com.myproject.elearning.dagger.module.ActivityModule_ProvideAboutPresenterFactory;
import com.myproject.elearning.dagger.module.ActivityModule_ProvideCompositeDisposableFactory;
import com.myproject.elearning.dagger.module.ActivityModule_ProvideLessonCategoriesPresenterFactory;
import com.myproject.elearning.dagger.module.ActivityModule_ProvideLessonDetailPresenterFactory;
import com.myproject.elearning.dagger.module.ActivityModule_ProvideLessonListingPresenterFactory;
import com.myproject.elearning.dagger.module.ActivityModule_ProvideLoginPresenterFactory;
import com.myproject.elearning.dagger.module.ActivityModule_ProvideProfilePresenterFactory;
import com.myproject.elearning.dagger.module.ActivityModule_ProvideSchedulerProviderFactory;
import com.myproject.elearning.dagger.module.ActivityModule_ProvideSignUpPresenterFactory;
import com.myproject.elearning.dagger.module.ActivityModule_ProvideSplashPresenterFactory;
import com.myproject.elearning.data.DataManager;
import com.myproject.elearning.ui.about.AboutBaseView;
import com.myproject.elearning.ui.about.AboutFragment;
import com.myproject.elearning.ui.about.AboutFragment_MembersInjector;
import com.myproject.elearning.ui.about.AboutMvpPresenter;
import com.myproject.elearning.ui.about.AboutPresenter;
import com.myproject.elearning.ui.about.AboutPresenter_Factory;
import com.myproject.elearning.ui.lessoncategories.LessonCategoriesBaseView;
import com.myproject.elearning.ui.lessoncategories.LessonCategoriesFragment;
import com.myproject.elearning.ui.lessoncategories.LessonCategoriesFragment_MembersInjector;
import com.myproject.elearning.ui.lessoncategories.LessonCategoriesMvpPresenter;
import com.myproject.elearning.ui.lessoncategories.LessonCategoriesPresenter;
import com.myproject.elearning.ui.lessoncategories.LessonCategoriesPresenter_Factory;
import com.myproject.elearning.ui.lessondetail.LessonDetailActivity;
import com.myproject.elearning.ui.lessondetail.LessonDetailActivity_MembersInjector;
import com.myproject.elearning.ui.lessondetail.LessonDetailBaseView;
import com.myproject.elearning.ui.lessondetail.LessonDetailMvpPresenter;
import com.myproject.elearning.ui.lessondetail.LessonDetailPresenter;
import com.myproject.elearning.ui.lessondetail.LessonDetailPresenter_Factory;
import com.myproject.elearning.ui.lessonlisting.LessonListingActivity;
import com.myproject.elearning.ui.lessonlisting.LessonListingActivity_MembersInjector;
import com.myproject.elearning.ui.lessonlisting.LessonListingBaseView;
import com.myproject.elearning.ui.lessonlisting.LessonListingMvpPresenter;
import com.myproject.elearning.ui.lessonlisting.LessonListingPresenter;
import com.myproject.elearning.ui.lessonlisting.LessonListingPresenter_Factory;
import com.myproject.elearning.ui.login.LoginActivity;
import com.myproject.elearning.ui.login.LoginActivity_MembersInjector;
import com.myproject.elearning.ui.login.LoginBaseView;
import com.myproject.elearning.ui.login.LoginMvpPresenter;
import com.myproject.elearning.ui.login.LoginPresenter;
import com.myproject.elearning.ui.login.LoginPresenter_Factory;
import com.myproject.elearning.ui.profile.ProfileBaseView;
import com.myproject.elearning.ui.profile.ProfileFragment;
import com.myproject.elearning.ui.profile.ProfileFragment_MembersInjector;
import com.myproject.elearning.ui.profile.ProfileMvpPresenter;
import com.myproject.elearning.ui.profile.ProfilePresenter;
import com.myproject.elearning.ui.profile.ProfilePresenter_Factory;
import com.myproject.elearning.ui.signup.SignUpActivity;
import com.myproject.elearning.ui.signup.SignUpActivity_MembersInjector;
import com.myproject.elearning.ui.signup.SignUpBaseView;
import com.myproject.elearning.ui.signup.SignUpMvpPresenter;
import com.myproject.elearning.ui.signup.SignUpPresenter;
import com.myproject.elearning.ui.signup.SignUpPresenter_Factory;
import com.myproject.elearning.ui.splash.SplashActivity;
import com.myproject.elearning.ui.splash.SplashActivity_MembersInjector;
import com.myproject.elearning.ui.splash.SplashBaseView;
import com.myproject.elearning.ui.splash.SplashMvpPresenter;
import com.myproject.elearning.ui.splash.SplashPresenter;
import com.myproject.elearning.ui.splash.SplashPresenter_Factory;
import com.myproject.elearning.utils.rx.SchedulerProvider;
import dagger.MembersInjector;
import dagger.internal.DoubleCheck;
import dagger.internal.Factory;
import dagger.internal.MembersInjectors;
import dagger.internal.Preconditions;
import io.reactivex.disposables.CompositeDisposable;
import javax.annotation.Generated;
import javax.inject.Provider;

@Generated(
  value = "dagger.internal.codegen.ComponentProcessor",
  comments = "https://google.github.io/dagger"
)
public final class DaggerActivityComponent implements ActivityComponent {
  private Provider<DataManager> getDataManagerProvider;

  private Provider<SchedulerProvider> provideSchedulerProvider;

  private Provider<CompositeDisposable> provideCompositeDisposableProvider;

  private Provider<SplashPresenter<SplashBaseView>> splashPresenterProvider;

  private Provider<SplashMvpPresenter<SplashBaseView>> provideSplashPresenterProvider;

  private MembersInjector<SplashActivity> splashActivityMembersInjector;

  private Provider<LoginPresenter<LoginBaseView>> loginPresenterProvider;

  private Provider<LoginMvpPresenter<LoginBaseView>> provideLoginPresenterProvider;

  private MembersInjector<LoginActivity> loginActivityMembersInjector;

  private Provider<SignUpPresenter<SignUpBaseView>> signUpPresenterProvider;

  private Provider<SignUpMvpPresenter<SignUpBaseView>> provideSignUpPresenterProvider;

  private MembersInjector<SignUpActivity> signUpActivityMembersInjector;

  private Provider<LessonCategoriesPresenter<LessonCategoriesBaseView>>
      lessonCategoriesPresenterProvider;

  private Provider<LessonCategoriesMvpPresenter<LessonCategoriesBaseView>>
      provideLessonCategoriesPresenterProvider;

  private MembersInjector<LessonCategoriesFragment> lessonCategoriesFragmentMembersInjector;

  private Provider<LessonListingPresenter<LessonListingBaseView>> lessonListingPresenterProvider;

  private Provider<LessonListingMvpPresenter<LessonListingBaseView>>
      provideLessonListingPresenterProvider;

  private MembersInjector<LessonListingActivity> lessonListingActivityMembersInjector;

  private Provider<LessonDetailPresenter<LessonDetailBaseView>> lessonDetailPresenterProvider;

  private Provider<LessonDetailMvpPresenter<LessonDetailBaseView>>
      provideLessonDetailPresenterProvider;

  private MembersInjector<LessonDetailActivity> lessonDetailActivityMembersInjector;

  private Provider<ProfilePresenter<ProfileBaseView>> profilePresenterProvider;

  private Provider<ProfileMvpPresenter<ProfileBaseView>> provideProfilePresenterProvider;

  private MembersInjector<ProfileFragment> profileFragmentMembersInjector;

  private Provider<AboutPresenter<AboutBaseView>> aboutPresenterProvider;

  private Provider<AboutMvpPresenter<AboutBaseView>> provideAboutPresenterProvider;

  private MembersInjector<AboutFragment> aboutFragmentMembersInjector;

  private DaggerActivityComponent(Builder builder) {
    assert builder != null;
    initialize(builder);
  }

  public static Builder builder() {
    return new Builder();
  }

  @SuppressWarnings("unchecked")
  private void initialize(final Builder builder) {

    this.getDataManagerProvider =
        new Factory<DataManager>() {
          private final ApplicationComponent applicationComponent = builder.applicationComponent;

          @Override
          public DataManager get() {
            return Preconditions.checkNotNull(
                applicationComponent.getDataManager(),
                "Cannot return null from a non-@Nullable component method");
          }
        };

    this.provideSchedulerProvider =
        ActivityModule_ProvideSchedulerProviderFactory.create(builder.activityModule);

    this.provideCompositeDisposableProvider =
        ActivityModule_ProvideCompositeDisposableFactory.create(builder.activityModule);

    this.splashPresenterProvider =
        SplashPresenter_Factory.create(
            MembersInjectors.<SplashPresenter<SplashBaseView>>noOp(),
            getDataManagerProvider,
            provideSchedulerProvider,
            provideCompositeDisposableProvider);

    this.provideSplashPresenterProvider =
        DoubleCheck.provider(
            ActivityModule_ProvideSplashPresenterFactory.create(
                builder.activityModule, splashPresenterProvider));

    this.splashActivityMembersInjector =
        SplashActivity_MembersInjector.create(provideSplashPresenterProvider);

    this.loginPresenterProvider =
        LoginPresenter_Factory.create(
            MembersInjectors.<LoginPresenter<LoginBaseView>>noOp(),
            getDataManagerProvider,
            provideSchedulerProvider,
            provideCompositeDisposableProvider);

    this.provideLoginPresenterProvider =
        DoubleCheck.provider(
            ActivityModule_ProvideLoginPresenterFactory.create(
                builder.activityModule, loginPresenterProvider));

    this.loginActivityMembersInjector =
        LoginActivity_MembersInjector.create(provideLoginPresenterProvider);

    this.signUpPresenterProvider =
        SignUpPresenter_Factory.create(
            MembersInjectors.<SignUpPresenter<SignUpBaseView>>noOp(),
            getDataManagerProvider,
            provideSchedulerProvider,
            provideCompositeDisposableProvider);

    this.provideSignUpPresenterProvider =
        DoubleCheck.provider(
            ActivityModule_ProvideSignUpPresenterFactory.create(
                builder.activityModule, signUpPresenterProvider));

    this.signUpActivityMembersInjector =
        SignUpActivity_MembersInjector.create(provideSignUpPresenterProvider);

    this.lessonCategoriesPresenterProvider =
        LessonCategoriesPresenter_Factory.create(
            MembersInjectors.<LessonCategoriesPresenter<LessonCategoriesBaseView>>noOp(),
            getDataManagerProvider,
            provideSchedulerProvider,
            provideCompositeDisposableProvider);

    this.provideLessonCategoriesPresenterProvider =
        ActivityModule_ProvideLessonCategoriesPresenterFactory.create(
            builder.activityModule, lessonCategoriesPresenterProvider);

    this.lessonCategoriesFragmentMembersInjector =
        LessonCategoriesFragment_MembersInjector.create(provideLessonCategoriesPresenterProvider);

    this.lessonListingPresenterProvider =
        LessonListingPresenter_Factory.create(
            MembersInjectors.<LessonListingPresenter<LessonListingBaseView>>noOp(),
            getDataManagerProvider,
            provideSchedulerProvider,
            provideCompositeDisposableProvider);

    this.provideLessonListingPresenterProvider =
        ActivityModule_ProvideLessonListingPresenterFactory.create(
            builder.activityModule, lessonListingPresenterProvider);

    this.lessonListingActivityMembersInjector =
        LessonListingActivity_MembersInjector.create(provideLessonListingPresenterProvider);

    this.lessonDetailPresenterProvider =
        LessonDetailPresenter_Factory.create(
            MembersInjectors.<LessonDetailPresenter<LessonDetailBaseView>>noOp(),
            getDataManagerProvider,
            provideSchedulerProvider,
            provideCompositeDisposableProvider);

    this.provideLessonDetailPresenterProvider =
        ActivityModule_ProvideLessonDetailPresenterFactory.create(
            builder.activityModule, lessonDetailPresenterProvider);

    this.lessonDetailActivityMembersInjector =
        LessonDetailActivity_MembersInjector.create(provideLessonDetailPresenterProvider);

    this.profilePresenterProvider =
        ProfilePresenter_Factory.create(
            MembersInjectors.<ProfilePresenter<ProfileBaseView>>noOp(),
            getDataManagerProvider,
            provideSchedulerProvider,
            provideCompositeDisposableProvider);

    this.provideProfilePresenterProvider =
        ActivityModule_ProvideProfilePresenterFactory.create(
            builder.activityModule, profilePresenterProvider);

    this.profileFragmentMembersInjector =
        ProfileFragment_MembersInjector.create(provideProfilePresenterProvider);

    this.aboutPresenterProvider =
        AboutPresenter_Factory.create(
            MembersInjectors.<AboutPresenter<AboutBaseView>>noOp(),
            getDataManagerProvider,
            provideSchedulerProvider,
            provideCompositeDisposableProvider);

    this.provideAboutPresenterProvider =
        ActivityModule_ProvideAboutPresenterFactory.create(
            builder.activityModule, aboutPresenterProvider);

    this.aboutFragmentMembersInjector =
        AboutFragment_MembersInjector.create(provideAboutPresenterProvider);
  }

  @Override
  public void inject(SplashActivity activity) {
    splashActivityMembersInjector.injectMembers(activity);
  }

  @Override
  public void inject(LoginActivity activity) {
    loginActivityMembersInjector.injectMembers(activity);
  }

  @Override
  public void inject(SignUpActivity activity) {
    signUpActivityMembersInjector.injectMembers(activity);
  }

  @Override
  public void inject(LessonCategoriesFragment fragment) {
    lessonCategoriesFragmentMembersInjector.injectMembers(fragment);
  }

  @Override
  public void inject(LessonListingActivity activity) {
    lessonListingActivityMembersInjector.injectMembers(activity);
  }

  @Override
  public void inject(LessonDetailActivity activity) {
    lessonDetailActivityMembersInjector.injectMembers(activity);
  }

  @Override
  public void inject(ProfileFragment fragment) {
    profileFragmentMembersInjector.injectMembers(fragment);
  }

  @Override
  public void inject(AboutFragment fragment) {
    aboutFragmentMembersInjector.injectMembers(fragment);
  }

  public static final class Builder {
    private ActivityModule activityModule;

    private ApplicationComponent applicationComponent;

    private Builder() {}

    public ActivityComponent build() {
      if (activityModule == null) {
        throw new IllegalStateException(ActivityModule.class.getCanonicalName() + " must be set");
      }
      if (applicationComponent == null) {
        throw new IllegalStateException(
            ApplicationComponent.class.getCanonicalName() + " must be set");
      }
      return new DaggerActivityComponent(this);
    }

    public Builder activityModule(ActivityModule activityModule) {
      this.activityModule = Preconditions.checkNotNull(activityModule);
      return this;
    }

    public Builder applicationComponent(ApplicationComponent applicationComponent) {
      this.applicationComponent = Preconditions.checkNotNull(applicationComponent);
      return this;
    }
  }
}
