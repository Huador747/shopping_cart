<?php
include('../condb.php');

$p_id = $_GET['id'];

$sql = "SELECT p_name, p_price FROM tbl_product WHERE p_id = $p_id";
$result = mysqli_query($con, $sql);

if ($result) {
    $row = mysqli_fetch_assoc($result);
    echo json_encode(['success' => true, 'name' => $row['p_name'], 'price' => $row['p_price']]);
} else {
    echo json_encode(['success' => false]);
}

mysqli_close($con);
?>
