package com.myproject.elearning.ui.main;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.view.Gravity;

import com.myproject.elearning.callback.DialogCallback;
import com.myproject.elearning.R;
import com.myproject.elearning.ui.about.AboutFragment;
import com.myproject.elearning.ui.base.BaseActivity;
import com.myproject.elearning.ui.dialog.appdialog.AppDialog;
import com.myproject.elearning.ui.dialog.language.LanguageDialog;
import com.myproject.elearning.ui.lessoncategories.LessonCategoriesFragment;
import com.myproject.elearning.ui.login.LoginActivity;
import com.myproject.elearning.ui.profile.ProfileFragment;
import com.myproject.elearning.utils.AppLogger;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

import static com.myproject.elearning.utils.KeyboardUtils.hideSoftInput;

/**
 * Created by Nhat on 1/11/18.
 */

public class MainActivity extends BaseActivity {

    private static final String TAG = "MainActivity";

    public static Intent getStartIntent(Context context) {
        Intent intent = new Intent(context, MainActivity.class);
        return intent;
    }

    //LeftMenu
    @BindView(R.id.drawerLayout)
    DrawerLayout drawerLayout;


    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        setUnBinder(ButterKnife.bind(this));

        setUp();

        getSupportFragmentManager()
                .beginTransaction()
                .disallowAddToBackStack()
                .add(R.id.frameContent, LessonCategoriesFragment.newInstance(), LessonCategoriesFragment.TAG)
                .commit();
    }

    @Override
    protected void setUp() {
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawerLayout, null, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawerLayout.addDrawerListener(toggle);
        toggle.syncState();
    }

    @OnClick(R.id.btnLessonCategories)
    public void onLessonCategoriesClick() {
        openFragment(LessonCategoriesFragment.newInstance(), LessonCategoriesFragment.TAG);
    }

    @OnClick(R.id.btnPersonalInformation)
    public void onPersonalInformationClick() {
        openFragment(ProfileFragment.newInstance(), ProfileFragment.TAG);
    }

    @OnClick(R.id.btnChangeLanguage)
    public void onChangeLanguageClick() {
        LanguageDialog languageDialog = LanguageDialog.newInstance();
        languageDialog.show(getSupportFragmentManager());
        languageDialog.setCallback(new DialogCallback<LanguageDialog>() {
            @Override
            public void onNegative(LanguageDialog dialog) {
                dialog.dismissDialog(LanguageDialog.TAG);
            }

            @Override
            public void onPositive(LanguageDialog dialog, Object o) {
                dialog.dismissDialog(LanguageDialog.TAG);
                AppLogger.i(TAG + "----> Language selected: " + o);
            }
        });
    }

    @OnClick(R.id.btnAbout)
    public void onAboutClick() {
        openFragment(AboutFragment.newInstance(), AboutFragment.TAG);
    }

    @OnClick(R.id.btnLogout)
    public void onLogoutClick() {
        showConfirmDialog(getString(R.string.logout), getString(R.string.message_confirm_logout), new DialogCallback<AppDialog>() {
            @Override
            public void onNegative(AppDialog dialog) {
                dialog.dismissDialog(AppDialog.TAG);
            }

            @Override
            public void onPositive(AppDialog dialog, Object o) {
                dialog.dismissDialog(AppDialog.TAG);
                Intent intent = new Intent(MainActivity.this, LoginActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
                MainActivity.this.finish();
            }
        });
    }


    public void lockDrawer() {
        if (drawerLayout != null)
            drawerLayout.setDrawerLockMode(DrawerLayout.LOCK_MODE_LOCKED_CLOSED);
    }


    public void unlockDrawer() {
        if (drawerLayout != null)
            drawerLayout.setDrawerLockMode(DrawerLayout.LOCK_MODE_UNLOCKED);
    }

    @Override
    public void onFragmentAttached() {
    }

    @Override
    public void onFragmentDetached(String tag) {
        FragmentManager fragmentManager = getSupportFragmentManager();
        Fragment fragment = fragmentManager.findFragmentByTag(tag);
        if (fragment != null) {
            fragmentManager
                    .beginTransaction()
                    .disallowAddToBackStack()
                    .remove(fragment)
                    .commitNow();
            unlockDrawer();
        }
    }

    private void openFragment(Fragment fragment, String tag) {
        lockDrawer();
        getSupportFragmentManager()
                .beginTransaction()
                .disallowAddToBackStack()
                .replace(R.id.frameContent, fragment, tag)
                .commit();
    }

    public void openMenu() {
        hideSoftInput(this);
        drawerLayout.openDrawer(Gravity.START);
    }
}
