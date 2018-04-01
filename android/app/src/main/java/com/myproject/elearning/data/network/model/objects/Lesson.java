package com.myproject.elearning.data.network.model.objects;

import android.os.Parcel;
import android.os.Parcelable;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Nhat on 1/13/18.
 */

public class Lesson implements Parcelable {

    private int id;
    private String title;
    private String image;

    public Lesson(int id, String title, String image) {
        this.id = id;
        this.title = title;
        this.image = image;
    }

    protected Lesson(Parcel in) {
        id = in.readInt();
        title = in.readString();
        image = in.readString();
    }

    public static final Creator<Lesson> CREATOR = new Creator<Lesson>() {
        @Override
        public Lesson createFromParcel(Parcel in) {
            return new Lesson(in);
        }

        @Override
        public Lesson[] newArray(int size) {
            return new Lesson[size];
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }


    public static List<Lesson> getDummiesData() {
        List<Lesson> lessons = new ArrayList<>();
        for (int i = 0; i < 30; i++) {
            int id = i + 1;
            lessons.add(new Lesson(id, "Lesson " + id, "http://www.russianforfree.com/resources/art_course/next%20lesson-01.jpg?timestamp=1295036525101"));
        }
        return lessons;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(id);
        parcel.writeString(title);
        parcel.writeString(image);
    }
}
