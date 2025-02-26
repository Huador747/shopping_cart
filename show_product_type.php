<?php
$type_id = $_GET['type_id'];
//echo $type_id;
//exit();


$query_product_type = "SELECT * FROM tbl_product as p 
INNER JOIN tbl_type as t
ON p.type_id = t.type_id
where p.type_id = $type_id
ORDER BY p.p_id ASC";
$result_project = mysqli_query($con, $query_product_type) or die
    ("Error in query: $query_product_type" . mysqli_error());


//echo ($query_product_type); //อันนี้เป็นแค่ตรวจคำสั่ง ว่า คิวรี่ตางรางถูกไหม ว่าถูกต้องหรือไม่
//exit();
?>
<div class="row">
    <?php foreach ($result_project as $row_project) { ?>
        <div class="card" style="width: 20rem; min-height: 350px; margin-top: 10px; margin-right: 7px; background-color: white; border-radius: 10px; 
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); overflow: hidden; display: flex; flex-direction: column;">

            <!-- รูปภาพ -->
            <div style="width: 100%; height: 100%; overflow: hidden;">
                <img src="p_img/<?php echo htmlspecialchars($row_project['p_img']); ?>" class="card-img-top"
                    alt="<?php echo htmlspecialchars($row_project['p_name']); ?>"
                    style="width: 100%; object-fit: cover;">
            </div>

            <!-- เนื้อหาของการ์ด -->
            <div class="card-body" 
                style="flex-grow: 1; display: flex; flex-direction: column; justify-content: center; padding-top: 15px;">
                <h5 class="card-title" style="font-size: 1rem; font-weight: 400;">
                    <?php echo htmlspecialchars($row_project['p_name']); ?>
                </h5>
                <p class="card-text" style="font-size: 1rem; font-weight: 300;">
                    ประเภท: <?php echo htmlspecialchars($row_project['type_name']); ?>
                </p>
                <a href="prd.php?id=<?php echo $row_project['p_id']; ?>" class="btn"
                    style="background-color: rgb(104, 105, 104); color: white; font-size: 1rem; text-align: center;">
                    ดูรายละเอียดสินค้า
                </a>
            </div>
        </div>
    <?php } ?>
</div>
