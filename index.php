<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <!-- CSS only -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <div class="row justify-content-around">
        <?php
        include('dbh.php');
        $json_filename = "data.json";
        $json = file_get_contents($json_filename);
        $json_data = json_decode($json, true);
        //print_r($json_data);
        $json_data = $json_data['data'];
        for ($i = 0; $i < count($json_data); $i++) {
            //print_r($json_data['data'][$i]["section_id"]);
            $id = $json_data[$i]["id"];
            $certification_id = $json_data[$i]["certification_id"];
            $section_id = $json_data[$i]["section_id"];
            $title = $json_data[$i]["title"];
            $sub_title = $json_data[$i]["sub_title"];
            $question_no = $json_data[$i]["question_no"];
            $question = $json_data[$i]["question"];

            $option_type = $json_data[$i]["option_type"];
            $note = $json_data[$i]["note"];
            $documents = $json_data[$i]["documents"];
            $is_answered = $json_data[$i]["is_answered"];



            $sql_insert = "INSERT INTO `question_tbl`(`id`,`certification_id`, `section_id`, `title`, `sub_title`, `question_no`,
             `question`, `option_type`, `note`, `documents`, `is_answered`)
             VALUES ('$id','$certification_id','$section_id','$title','$sub_title','$question_no','$question','$option_type',
             '$note','$documents','$is_answered')";
            $query = $conn->query($sql_insert);
            // echo $sql_insert;
            // echo $query;
            foreach ($json_data[$i]["options"] as $value) {
                $opt_id = $value['id'];
                $opt_certification_id = $value['certification_id'];
                $opt_name = $value['name'];
                $opt_score = $value['score'];
                $sql_insert_opt = "INSERT INTO `options_tbl`(`id`,`question_id`,`certification_id`, `name`, `score`) 
                VALUES ('$opt_id','$id','$opt_certification_id','$opt_name','$opt_score ')";
                $query_opt = $conn->query($sql_insert_opt);
            }
            if ($query) {
                echo "Success";
            } else {
                echo "Error";
            }
        }
        ?>
    </div>
</body>

</html>