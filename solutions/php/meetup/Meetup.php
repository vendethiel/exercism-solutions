<?php

declare(strict_types=1);



function meetup_day(int $year, int $month, string $which, string $weekday): DateTimeImmutable
{
    if ('teenth' === $which) {
        $date = new DateTimeImmutable("$year-$month-12");
        return $date->modify("next $weekday");
    } else {
        $monthName = date('F', mktime(0, 0, 0, $month, 10));
        return new DateTimeImmutable("$which $weekday of $monthName $year");
    }
}
