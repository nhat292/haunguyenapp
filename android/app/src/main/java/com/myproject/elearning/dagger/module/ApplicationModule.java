
package com.myproject.elearning.dagger.module;

import android.app.Application;
import android.content.Context;

import com.myproject.elearning.BuildConfig;
import com.myproject.elearning.R;
import com.myproject.elearning.dagger.ApiInfo;
import com.myproject.elearning.dagger.ApplicationContext;
import com.myproject.elearning.dagger.DatabaseInfo;
import com.myproject.elearning.dagger.PreferenceInfo;
import com.myproject.elearning.data.AppDataManager;
import com.myproject.elearning.data.DataManager;
import com.myproject.elearning.data.db.AppDbHelper;
import com.myproject.elearning.data.db.DbHelper;
import com.myproject.elearning.data.network.ApiHeader;
import com.myproject.elearning.data.network.ApiHelper;
import com.myproject.elearning.data.network.AppApiHelper;
import com.myproject.elearning.data.prefs.AppPreferencesHelper;
import com.myproject.elearning.data.prefs.PreferencesHelper;
import com.myproject.elearning.utils.AppConstants;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import uk.co.chrisjenx.calligraphy.CalligraphyConfig;

/**
 * Created by Nhat on 12/13/17.
 */


@Module
public class ApplicationModule {

    private final Application mApplication;

    public ApplicationModule(Application application) {
        mApplication = application;
    }

    @Provides
    @ApplicationContext
    Context provideContext() {
        return mApplication;
    }

    @Provides
    Application provideApplication() {
        return mApplication;
    }

    @Provides
    @DatabaseInfo
    String provideDatabaseName() {
        return AppConstants.DB_NAME;
    }

    @Provides
    @ApiInfo
    String provideApiKey() {
        return BuildConfig.API_KEY;
    }

    @Provides
    @PreferenceInfo
    String providePreferenceName() {
        return AppConstants.PREF_NAME;
    }

    @Provides
    @Singleton
    DataManager provideDataManager(AppDataManager appDataManager) {
        return appDataManager;
    }

    @Provides
    @Singleton
    DbHelper provideDbHelper(AppDbHelper appDbHelper) {
        return appDbHelper;
    }

    @Provides
    @Singleton
    PreferencesHelper providePreferencesHelper(AppPreferencesHelper appPreferencesHelper) {
        return appPreferencesHelper;
    }

    @Provides
    @Singleton
    ApiHelper provideApiHelper(AppApiHelper appApiHelper) {
        return appApiHelper;
    }

    @Provides
    @Singleton
    ApiHeader.ProtectedApiHeader provideProtectedApiHeader(@ApiInfo String apiKey,
                                                           PreferencesHelper preferencesHelper) {
        return new ApiHeader.ProtectedApiHeader(
                apiKey,
                preferencesHelper.getCurrentUserId(),
                preferencesHelper.getAccessToken());
    }

    @Provides
    @Singleton
    CalligraphyConfig provideCalligraphyDefaultConfig() {
        return new CalligraphyConfig.Builder()
                .setDefaultFontPath("fonts/source-sans-pro/SourceSansPro-Regular.ttf")
                .setFontAttrId(R.attr.fontPath)
                .build();
    }
}
