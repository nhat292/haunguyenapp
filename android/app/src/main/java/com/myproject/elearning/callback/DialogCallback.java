package com.myproject.elearning.callback;

/**
 * Created by Nhat on 12/19/17.
 */

public interface DialogCallback<T> {

    void onNegative(T dialog);

    void onPositive(T dialog, Object o);
}
