package com.myproject.elearning;

import com.myproject.elearning.data.DataManager;
import dagger.MembersInjector;
import javax.annotation.Generated;
import javax.inject.Provider;

@Generated(
  value = "dagger.internal.codegen.ComponentProcessor",
  comments = "https://google.github.io/dagger"
)
public final class App_MembersInjector implements MembersInjector<App> {
  private final Provider<DataManager> mDataManagerProvider;

  public App_MembersInjector(Provider<DataManager> mDataManagerProvider) {
    assert mDataManagerProvider != null;
    this.mDataManagerProvider = mDataManagerProvider;
  }

  public static MembersInjector<App> create(Provider<DataManager> mDataManagerProvider) {
    return new App_MembersInjector(mDataManagerProvider);
  }

  @Override
  public void injectMembers(App instance) {
    if (instance == null) {
      throw new NullPointerException("Cannot inject members into a null reference");
    }
    instance.mDataManager = mDataManagerProvider.get();
  }

  public static void injectMDataManager(App instance, Provider<DataManager> mDataManagerProvider) {
    instance.mDataManager = mDataManagerProvider.get();
  }
}
