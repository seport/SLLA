<?php
    include 'env.php';
    $site_path_var = $_ENV["ROOT_FOLDER"];
    echo $site_path_var;
?>
<!DOCTYPE html>
<html>
<head>
<title>Stay Loud, LA!</title>
<link rel="stylesheet" type="text/css" href="<?php echo $site_path_var ?>resources/css/style.css">
<link rel="icon" type="image/png" href="<?php echo $site_path_var ?>resources/images/favicon.png">

<link href="https://fonts.googleapis.com/css?family=Oswald:300,400,700" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<meta property="og:title" content="Stay Loud, LA!" />
<meta property="og:image" content="http://www.stayloudla.com/ogimage.png" />
<meta property="og:description" content="Find a protest near you! LA's participation in the protests against the Trump administration's unconstitutional policies have proven all of the stereotypes about this city wrong. LA is filled with passionate and engaged activists who have inspired us to keep the momentum going and apply as much pressure as we can on the new administration. Let's stay loud, LA!" />
