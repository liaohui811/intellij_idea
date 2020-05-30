<?xml version="1.0" encoding="utf-8"?>
<navigation xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/mobile_navigation"
    app:startDestination="@+id/navigation_home">

    <fragment
        android:id="@+id/navigation_home"
        android:name="${packageName}.ui.home.HomeFragment"
        android:label="@string/title_home"
        tools:layout="@layout/fragment_home">

        <action
            android:id="@+id/action_HomeFragment_to_HomeSecondFragment"
            app:destination="@id/navigation_home_second" />
    </fragment>
    <fragment
        android:id="@+id/navigation_home_second"
        android:name="${packageName}.ui.home.HomeSecondFragment"
        android:label="@string/home_second"
        tools:layout="@layout/fragment_home_second">
        <action
            android:id="@+id/action_HomeSecondFragment_to_HomeFragment"
            app:destination="@id/navigation_home" />

        <argument
            android:name="myArg"
            app:argType="string" />
    </fragment>

    <fragment
        android:id="@+id/navigation_dashboard"
        android:name="${packageName}.ui.dashboard.DashboardFragment"
        android:label="@string/title_dashboard"
        tools:layout="@layout/fragment_dashboard" />

    <fragment
        android:id="@+id/navigation_notifications"
        android:name="${packageName}.ui.notifications.NotificationsFragment"
        android:label="@string/title_notifications"
        tools:layout="@layout/fragment_notifications" />
</navigation>