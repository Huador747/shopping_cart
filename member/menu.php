<!--สร้างเมนูด้วย Bootstrap วนลูปด้วยคำสั่ง Foreach PHP + MySQLi-->
<?php require_once('../condb.php');

$query_type = "SELECT * FROM tbl_type ORDER BY type_id ASC";
$result_type = mysqli_query($con, $query_type) or die("Error in query: $query_type " . mysqli_error());
//echo($query_type); อันนี้เป็นแค่ตรวจคำสั่ง ว่า คิวรี่ตางรางถูกไหม ว่าถูกต้องหรือไม่
//exit()
?>

<div class="list-group" style="border: 1px solid #ccc; font-size: 1.rem; text-align: left;">
    <?php
    foreach ($result_type as $row) { ?><!--loop foreach-->
        <a href="index.php?act=showbytype&type_id=<?php echo $row['type_id']; ?>"
            class="list-group-item list-group-item-action list-group-item-light border border-black"
            style="color:rgb(255, 255, 255); background-color: rgb(104, 105, 104)">
            <?php echo $row["type_name"]; ?><!--ดึงข้อมูลจาก type_name-->
        </a>
    <?php } ?>
</div>