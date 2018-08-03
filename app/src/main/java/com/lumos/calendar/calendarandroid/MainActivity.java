package com.lumos.calendar.calendarandroid;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.joda.time.DateTime;

import android.os.Bundle;
import android.app.Activity;
import android.widget.TextView;
import android.widget.Toast;

import com.yuyakaido.android.couplescalendar.model.CouplesCalendarEvent;
import com.yuyakaido.android.couplescalendar.model.Theme;
import com.yuyakaido.android.couplescalendar.ui.CouplesCalendarView;

import android.text.format.DateUtils;

public class MainActivity extends Activity implements CouplesCalendarView.OnMonthChangeListener, CouplesCalendarView.OnDateClickListener {

    private TextView currentMonth;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        CouplesCalendarView view = findViewById(R.id.activity_main_couples_calendar_view);
        view.setOnMonthChangeListener(this);
        view.setOnDateClickListener(this);

        view.setEvents(getDummyEvents());

        currentMonth = findViewById(R.id.current_month);

        int flags = DateUtils.FORMAT_SHOW_YEAR | DateUtils.FORMAT_SHOW_DATE | DateUtils.FORMAT_NO_MONTH_DAY;
        Date month = new Date();
        currentMonth.setText(DateUtils.formatDateTime(this, month.getTime(), flags));

    }

    @Override
    public void onMonthChange(Date month) {
        int flags = DateUtils.FORMAT_SHOW_YEAR | DateUtils.FORMAT_SHOW_DATE | DateUtils.FORMAT_NO_MONTH_DAY;
        setTitle(DateUtils.formatDateTime(this, month.getTime(), flags));
        currentMonth.setText(DateUtils.formatDateTime(this, month.getTime(), flags));
    }

    @Override
    public void onDateClick(Date date) {
        int flags = DateUtils.FORMAT_SHOW_YEAR | DateUtils.FORMAT_SHOW_DATE;
        String str = DateUtils.formatDateTime(this, date.getTime(), flags);
        Toast.makeText(this, str, Toast.LENGTH_SHORT).show();

    }

    private List<CouplesCalendarEvent> getDummyEvents() {
        List<CouplesCalendarEvent> couplesCalendarEvents = new ArrayList<>();

        SampleEvent sampleEvent = new SampleEvent();
        sampleEvent.setStartAt(new DateTime("2015-06-01T00:00:00.000Z").toDate());
        sampleEvent.setEndAt(new DateTime("2015-06-01T01:00:00.000Z").toDate());
        sampleEvent.setEventColor(getResources().getColor(Theme.RED.getEventColorId()));
        sampleEvent.setRecurrenceRule("FREQ=WEEKLY");
        couplesCalendarEvents.add(sampleEvent);

        return couplesCalendarEvents;
    }


}