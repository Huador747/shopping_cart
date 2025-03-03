<?php require_once('../condb.php');  // Assuming you have a session or a query to get the member's name
session_start();
if (isset($_SESSION['member_id'])) {
    $member_id = $_SESSION['member_id'];
    $query_member = "SELECT m_name FROM tbl_member WHERE member_id = $member_id";
    $result_member = mysqli_query($con, $query_member) or die("Error in query: $query_member " . mysqli_error($con));
    $row_member = mysqli_fetch_assoc($result_member);
    $m_name = $row_member['m_name'];
} else {
    $m_name = "Guest";
}

$query_typeprd = "SELECT * FROM tbl_type ORDER BY type_id ASC";
$typeprd = mysqli_query($con, $query_typeprd) or die("Error in query: $query_typeprd " . mysqli_error($con));
$row_typeprd = mysqli_fetch_assoc($typeprd);
$totalRows_typeprd = mysqli_num_rows($typeprd);
?>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #333;">
                <a class="navbar-brand d-flex align-items-center" href="#">
                    <img src="../m_img/<?php echo htmlspecialchars($row['m_img']); ?>" width="50" height="50"
                        class="d-inline-block align-top" alt="">
                    <span class="ml-2" style="font-size: 1.5rem;"><?php echo htmlspecialchars($m_name); ?></span>
                </a>
                <a class="btn btn-secondary" href="index.php" role="button" style="font-size: 1.05rem;">หน้าหลัก</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <ul class="navbar-nav ml-2">
                    <?php if (!isset($member_id) || $member_id == '') { ?>
                    <?php } else { ?>
                        <li class="nav-item ml-2">
                            <a class="btn btn-danger" href="../logout.php" role="button"
                                onclick="return confirm('คุณต้องการออกจากระบบหรือไม่ ?')"
                                style="font-size: 1.05rem;">ออกจากระบบ</a>
                        </li>
                    <?php } ?>
                </ul>
                
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                    </ul>
                    
                    <!-- Cart Icon with Button -->
                    <?php if (!isset($member_id) || $member_id == '') { ?>
                        <a class="btn mr-3 d-flex align-items-center" href="#" role="button" style="font-size: 1.05rem;"
                           onclick="alert('กรุณาเข้าสู่ระบบก่อนใช้งานตะกร้าสินค้า'); window.location.href='form_login.php'; return false;">
                            <img src="../m_img/8648831.png" width="32" height="32" class="mr-2" alt="ตะกร้า">
                        </a>
                    <?php } else { ?>
                        <a class="btn mr-3 d-flex align-items-center" href="cart-item.php" role="button" style="font-size: 1.05rem;">
                            <img src="../m_img/8648831.png" width="32" height="32" class="mr-2" alt="ตะกร้า">

                        </a>
                    <?php } ?>
                    
                    <form class="form-inline my-2 my-lg-0" name="qp" action="index.php" method="GET">

                        <input class="form-control mr-sm-2" type="text" placeholder="ค้นหาสินค้า" name="q">
                        <button class="btn btn-secondary my-2 my-sm-0" type="submit"
                            style="font-size: 1.05rem;">ค้นหา</button>
                    </form>
                </div>
            </nav>
        </div>
    </div>
</div>