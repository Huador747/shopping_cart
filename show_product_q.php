<?php
$q = $_GET['q'];
$query_product = "SELECT * FROM tbl_product as p 
INNER JOIN tbl_type as t
ON p.type_id = t.type_id
WHERE p.p_name LIKE '%$q%'
ORDER BY p.p_id ASC";
$result_project = mysqli_query($con, $query_product) or die
    ("Error in query: $query_product" . mysqli_error());

//echo ($query_product); //อันนี้เป็นแค่ตรวจคำสั่ง ว่า คิวรี่ตางรางถูกไหม ว่าถูกต้องหรือไม่
//      exit()

?>

<div class="row">

    <?php foreach ($result_project as $row_project) { ?> <!--ใช้loop foreach เพื่อดึงค่าจากตารางdatabase-->
        <div class="card" style="width: 18rem; margin-top: 10px; margin-right: 7px; background-color: 
        white; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); overflow: hidden;">
            <img src="p_img/<?php echo $row_project['p_img']; ?>" class="card-img-top" alt="..."
                style="width: 100%; height: 100%; object-fit: cover;">
            <div class="card-body">
                <class="card-title" style="font-size: 1rem; font-weight: 400;"><?php echo $row_project['p_name'] ?></h5>
                    <!--ใช้Echoดึงชื่อสินค้ามาจากตาราง project-->
                    <p class="card-text" style="font-size: 1rem; font-weight: 300;">ประเภท:
                        <?php echo $row_project['type_name'] ?>
                    </p>
                    <a href="prd.php?id=<?php echo $row_project['p_id'] ?>" class="btn"
                        style="background-color: rgb(104, 105, 104); color: white; font-size: 1rem;">ดูรายละเอียดสินค้า</a>
            </div>
        </div>
    <?php } ?>
</div>