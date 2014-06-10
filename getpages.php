<?php
$pages = array(88,72,105,72,253); //2010


$output = array();
$csv = fopen('output_2013.csv', 'w');
$month = count($pages);
while($month-- > 1) {
    echo "\nmonth ... $month\n";
    $page_index = $pages[$month-1];
    while ($page_index-- > 1) {
        echo "\t ...page $page_index";
        $fh = fopen("https://newsreader.scraperwiki.com/summary_of_events_with_actor_type/page/{$page_index}?datefilter=2013-{$month}&uris.0=dbo:SoccerPlayer&output=csv", "r");
        while(($data = fgetcsv($fh, 0, ',') !== false)) {
            // $output[] = $data;
            fputcsv($csv, $data, ',');
        }
        fclose($fh);
    }
}


?>