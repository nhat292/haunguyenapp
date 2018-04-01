
package com.myproject.elearning.ui.lessoncategories;

import com.myproject.elearning.data.DataManager;
import com.myproject.elearning.ui.base.BasePresenter;
import com.myproject.elearning.utils.rx.SchedulerProvider;

import javax.inject.Inject;

import io.reactivex.disposables.CompositeDisposable;

/**
 * Created by Nhat on 12/13/17.
 */


public class LessonCategoriesPresenter<V extends LessonCategoriesBaseView> extends BasePresenter<V>
        implements LessonCategoriesMvpPresenter<V> {

    @Inject
    public LessonCategoriesPresenter(DataManager dataManager,
                                     SchedulerProvider schedulerProvider,
                                     CompositeDisposable compositeDisposable) {
        super(dataManager, schedulerProvider, compositeDisposable);
    }
}
