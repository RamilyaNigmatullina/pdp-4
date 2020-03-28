import moment from 'moment';

moment.calendarFormat = (date, now) => {
  const diff = date.diff(now, 'days', true);

  if (diff > 0) return 'sameDay';
  if (diff > -7) return 'lastWeek';
  if (date.year() === now.year()) return 'thisYear';

  return 'sameElse';
};

moment.locale('en', {
  calendar: {
    sameDay: 'HH:mm',
    lastWeek: 'ddd',
    thisYear: 'D.MM',
    sameElse: 'D.MM.YYYY',
  },
});
