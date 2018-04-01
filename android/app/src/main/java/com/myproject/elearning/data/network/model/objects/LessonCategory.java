package com.myproject.elearning.data.network.model.objects;

import android.os.Parcel;
import android.os.Parcelable;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created by Nhat on 1/13/18.
 */

public class LessonCategory implements Parcelable {

    private int id;
    private String title;
    private String subTitle;
    private int count;


    public LessonCategory(int id, String title, String subTitle, int count) {
        this.id = id;
        this.title = title;
        this.subTitle = subTitle;
        this.count = count;
    }

    protected LessonCategory(Parcel in) {
        id = in.readInt();
        title = in.readString();
        subTitle = in.readString();
        count = in.readInt();
    }

    public static final Creator<LessonCategory> CREATOR = new Creator<LessonCategory>() {
        @Override
        public LessonCategory createFromParcel(Parcel in) {
            return new LessonCategory(in);
        }

        @Override
        public LessonCategory[] newArray(int size) {
            return new LessonCategory[size];
        }
    };

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubTitle() {
        return subTitle;
    }

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }


    public static List<LessonCategory> getDummiesData() {
        List<LessonCategory> lessonCategories = new ArrayList<>();
        Random random = new Random();
        for (int i = 0; i < 30; i++) {
            int id = i + 1;
            lessonCategories.add(new LessonCategory(id, "Chương " + id, "Subtitle " + id, random.nextInt(20) + 1));
        }
        return lessonCategories;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(id);
        parcel.writeString(title);
        parcel.writeString(subTitle);
        parcel.writeInt(count);
    }
}
