<?php
$q = isset($_GET['q']) ? $_GET['q'] : ''; // ถ้าไม่มีค่าจะกำหนดให้เป็นค่าว่าง
include("condb.php");

$sql = "SELECT * FROM tbl_product as p
INNER JOIN tbl_type as t ON p.type_id=t.type_id
ORDER BY p.p_id DESC";  // เรียกข้อมูลมาแสดงทั้งหมด
$result = mysqli_query($con, $sql);
?>

<div class="row">
    <?php while ($row_prd = mysqli_fetch_array($result)) { ?>
        <div class="card"
            style="width: 18rem; min-height: 500px; margin-top: 10px; margin-right: 7px; background-color: white; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); overflow: hidden; display: flex; flex-direction: column;">
            
            <!-- กำหนดความสูงให้รูปภาพ -->
            <div class="card-img-container" style="width: 100%; height: 100%; overflow: hidden;">
                <img src="p_img/<?php echo htmlspecialchars($row_prd['p_img']); ?>" class="card-img-top img-fluid"
                    alt="<?php echo htmlspecialchars($row_prd['p_name']); ?>" 
                    style="width: 100%; height: object-fit: cover;">
            </div>

            <div class="card-body" style="flex-grow: 1; display: flex; flex-direction: column; justify-content: space-between;">
                <h5 class="card-title" style="font-size: 1.25rem; font-weight: 600; color: #2d3e50;">
                    <?php echo htmlspecialchars($row_prd['p_name']); ?>
                </h5>
                <p class="card-text" style="font-size: 1rem; font-weight: 300; color: #4b5c69;">
                    ประเภท: <?php echo htmlspecialchars($row_prd['type_name']); ?>
                </p>
                <p class="card-text" style="font-size: 1rem; font-weight: 300; color: #4b5c69;">
                    ราคา <span class="text-danger"><b><?php echo number_format($row_prd["p_price"], 2); ?></b></span> บาท
                </p>
                <p class="card-text" style="font-size: 1rem; font-weight: 300; color: #4b5c69;">
                    คงเหลือ <?php echo htmlspecialchars($row_prd["p_qty"]); ?> <?php echo htmlspecialchars($row_prd["p_unit"]); ?>
                </p>
                <a href="prd.php?id=<?php echo $row_prd['p_id']; ?>" class="btn"
                    style="background-color: rgb(104, 105, 104); color: white; font-size: 1rem; border-radius: 5px; padding: 8px 15px; text-align: center;">
                    รายละเอียดสินค้า
                </a>
            </div>
        </div>
    <?php } ?>
</div>